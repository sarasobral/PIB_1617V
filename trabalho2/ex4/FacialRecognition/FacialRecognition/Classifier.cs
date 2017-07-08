using System;

namespace FacialRecognition {
    public class Classifier {
        private static string path3 = FacialRecognition.Program.PATH3;
        private static string path2 = FacialRecognition.Program.PATH2;

        public static void RunClassifier()
        {
            FacialRecognition.Program.CleanUp();
            Console.Write("Indique o caminho da imagem a percorrer:\n(a)GroupElements\n(b)CaltechFaceDatabase\n(home)para retroceder\n");
            string imagFilePath, file, option = Console.ReadLine();
            if (option == "a") imagFilePath = path2;
            else if (option == "b") imagFilePath = path3;
            else return;
            Console.Write("Indique o nome da imagem: ");
            file = Console.ReadLine();
            FacialRecognition.ExtractFeatures.MakeDetectRequest(imagFilePath + file, file, "returnFaceId=false&returnFaceLandmarks=false&returnFaceAttributes=age", false, false);

            Console.WriteLine("\n\n\nEspere pelos resultados das características ...\nDepois pressione  enter\n\n");
            Console.ReadLine();
            string vectorToCompare = FacialRecognition.ExtractFeatures.vectorToCompare;
            if (vectorToCompare.Contains(","))
            {
                string[] vector = vectorToCompare.Split(',');
                double age = Convert.ToDouble(vector[vector.Length - 2].Replace(".", ","));

                if (age <= 34.7)
                {
                    if (age <= 23.4) Console.WriteLine("Sara Sobral");
                    else if (age <= 30.2) Console.WriteLine("Eduardo António");
                    else Console.WriteLine("pessoa 3");
                }
                else
                {
                    if (age <= 39.7) Console.WriteLine("pessoa 2");
                    else Console.WriteLine("pessoa 1");
                }
                Console.ReadLine();
            }
        }
    }
}
