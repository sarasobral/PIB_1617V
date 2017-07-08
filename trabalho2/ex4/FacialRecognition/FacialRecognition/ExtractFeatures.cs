using System;
using System.IO;
using System.Net.Http.Headers;
using System.Net.Http;

namespace FacialRecognition {
    public class ExtractFeatures {
        public static string vectorToCompare;

        
        public static async void MakeDetectRequest(string imageFilePath, String file, String queryString, bool json, bool save)
        {
            var client = new HttpClient();

            // Request headers - replace this example key with your valid key.
            client.DefaultRequestHeaders.Add("Ocp-Apim-Subscription-Key", "f425b4a578164d4cb30e7585a536d527");

            // NOTE: You must use the same region in your REST call as you used to obtain your subscription keys.
            //   For example, if you obtained your subscription keys from westus, replace "westcentralus" in the 
            //   URI below with "westus".
            string uri = "https://westcentralus.api.cognitive.microsoft.com/face/v1.0/detect?" + queryString;

            HttpResponseMessage response;
            string responseContent;

            // Request body. Try this sample with a locally stored JPEG image.
            byte[] byteData = GetImageAsByteArray(imageFilePath);

            using (var content = new ByteArrayContent(byteData))
            {
                // This example uses content type "application/octet-stream".
                // The other content types you can use are "application/json" and "multipart/form-data".
                content.Headers.ContentType = new MediaTypeHeaderValue("application/octet-stream");
                response = await client.PostAsync(uri, content);
                responseContent = response.Content.ReadAsStringAsync().Result;
            }

            //A peak at the JSON response.
            Console.WriteLine(file + ": " + responseContent);
            vectorToCompare = ExtractVector(file, imageFilePath, responseContent, json, save);
        }

        private static byte[] GetImageAsByteArray(string imageFilePath)
        {
            try
            {
                FileStream fileStream = new FileStream(imageFilePath, FileMode.Open, FileAccess.Read);
                BinaryReader binaryReader = new BinaryReader(fileStream);
                return binaryReader.ReadBytes((int)fileStream.Length);
            }
            catch (System.IO.FileNotFoundException e)
            {
                Console.WriteLine("Ficheiro não encontrado: " + imageFilePath);
                return new byte[0];
            }
            catch (System.IO.DirectoryNotFoundException e) {
                Console.WriteLine("Diretoria não encontrada: " + imageFilePath);
                return new byte[0];
            }
        }

        private static string ExtractVector(string file, string imageFilePath, string responseContent, bool json, bool save)
        {
            string finalValues = "", extension = ".txt";
            if (json)
            {
                finalValues = responseContent+",";
                extension = ".json";
            }
            else
            {
                string[] values = responseContent.Split(',', ':');
                foreach (string value in values)
                {
                    string val = value.Replace("male", "1").Replace("female", "0");
                    if (Char.IsDigit(val.ToCharArray()[0]))
                    {
                        string v = val.Replace("}", string.Empty).Replace("]", string.Empty);
                        finalValues += v + ",";
                    }
                }
            }
            string[] filename = file.Split('.');
            finalValues += filename[0];
            FacialRecognition.Program.ALL_FEATURES.AddLast(finalValues);
            if (save)
            {
                System.IO.StreamWriter writer = new System.IO.StreamWriter(imageFilePath.Replace(filename[1], extension));
                writer.WriteLine(finalValues);
                writer.Close();
            }
            return finalValues;
        }        

    }
}