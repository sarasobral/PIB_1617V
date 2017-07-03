using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using System.Net.Http.Headers;
using System.Net.Http;


namespace FacialRecognition {
    class Program {
        private static readonly String path1 = "..\\..\\..\\FaceImages\\";
        private static readonly String path2 = "..\\..\\..\\RealFaceImages\\";
        private static readonly String[] bd_images = { "face1.bmp", "face2.bmp", "face3.bmp", "face4.bmp", "face5.bmp" };
        private static readonly String[] real_images = { "bebe.jpg", "george.jpg", "samuel.jpg", "sara.jpg" };

        static void Main(string[] args)
        {
            String option;
            do
            {
                Console.Write("(a) Extrair caracteristicas\n"+
                    "(b) Identificar uma pessoa\n"+
                    "(exit) para encerrar a aplicação\n");
                option = Console.ReadLine();
                if (option == "a") { CleanUp(); ExtractFeatures(); }
                else if (option == "b") { CleanUp(); RunClassifier(); }
                else if (option == "exit") break;
            } while (true);
        }

        static byte[] GetImageAsByteArray(string imageFilePath)
        {
            FileStream fileStream = new FileStream(imageFilePath, FileMode.Open, FileAccess.Read);
            BinaryReader binaryReader = new BinaryReader(fileStream);
            return binaryReader.ReadBytes((int)fileStream.Length);
        }

        static async void MakeDetectRequest(string imageFilePath, String file, String queryString)
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
            if (file != "") file += ": ";
            Console.WriteLine(file + responseContent);
            String filename = imageFilePath + ".json";
            System.IO.StreamWriter writer = new System.IO.StreamWriter(filename);
            writer.WriteLine(responseContent);
            writer.Close();

        }

        static void MakeDetectRequestFor(String path, String[] images, String queryString)
        {
            for (int i = 0; i < images.Length; ++i)
                MakeDetectRequest(path + images[i], images[i], queryString);
        }

        static String ChooseFeatures()
        {
            Console.Write("Escolha as caracteristicas desejadas com y ou n:\n");
            String answer;
            String queryString = "returnFaceId=false";
            Console.Write("Face Landmarks ");
            answer = Console.ReadLine();
            if (answer == "y") queryString += "&returnFaceLandmarks=true";
            else queryString += "&returnFaceLandmarks=false";
            Console.Write("Face Attributes ");
            answer = Console.ReadLine();
            if (answer == "y")
            {
                queryString += "&returnFaceAttributes=";
                Console.Write("Age ");
                answer = Console.ReadLine();
                if (answer == "y") queryString += "age";
                Console.Write("Gender ");
                answer = Console.ReadLine();
                if (answer == "y") queryString += ",gender";
                Console.Write("Head Pose ");
                answer = Console.ReadLine();
                if (answer == "y") queryString += ",headPose";
                Console.Write("Smile ");
                answer = Console.ReadLine();
                if (answer == "y") queryString += ",smile";
                Console.Write("Facial Hair ");
                answer = Console.ReadLine();
                if (answer == "y") queryString += ",facialHair";
                Console.Write("Glasses ");
                answer = Console.ReadLine();
                if (answer == "y") queryString += ",glasses";
                Console.Write("Emotion ");
                answer = Console.ReadLine();
                if (answer == "y") queryString += ",emotion";
                Console.Write("Hair ");
                answer = Console.ReadLine();
                if (answer == "y") queryString += ",hair";
                Console.Write("Makeup ");
                answer = Console.ReadLine();
                if (answer == "y") queryString += ",makeup";
                Console.Write("Occlusion ");
                answer = Console.ReadLine();
                if (answer == "y") queryString += ",occlusion";
                Console.Write("Accessories ");
                answer = Console.ReadLine();
                if (answer == "y") queryString += ",accessories";
                Console.Write("Blur ");
                answer = Console.ReadLine();
                if (answer == "y") queryString += ",blur";
                Console.Write("Exposure ");
                answer = Console.ReadLine();
                if (answer == "y") queryString += ",exposure";
                Console.Write("Noise ");
                answer = Console.ReadLine();
                if (answer == "y") queryString += ",noise";
            }
            return queryString;
        }

        static void ExtractFeatures()
        {
            String option, queryString;
            do
            {
                Console.Write("(a) Extrair características de uma base de dados especifica\n"+
                    "(b) Extrair características de imagens reais\n"+
                    "(c) Inserir um caminho à escolha\n"+
                    "(home) para voltar ao início\n"+
                    "(exit) para encerrar a aplicação\n");
                option = Console.ReadLine();
                if (option == "home") { CleanUp(); return; }
                else if (option == "exit") System.Environment.Exit(1);
                queryString = ChooseFeatures(); // Request parameters
                if (option == "a") MakeDetectRequestFor(path1, bd_images, queryString);
                else if (option == "b") MakeDetectRequestFor(path2, real_images, queryString);
                else MakeDetectRequest(option, Path.GetFileName(option), queryString);

                Console.WriteLine("\n\n\nEspere pelos resultados ou vá à diretoria e consulte os ficheiro .txt gerados...\n\n\n");
                Console.ReadLine();
            } while (true);
        }

        static void RunClassifier() {
            String option;
            do
            {
                Console.Write("(home) para voltar ao início\n" +
                        "(exit) para encerrar a aplicação\n");
                option = Console.ReadLine();
                if (option == "home") { CleanUp();  return; }
                else if(option == "exit") System.Environment.Exit(1);
            } while (true);
        }
        static void CleanUp()
        {
            Console.Clear();
        }
    }
}