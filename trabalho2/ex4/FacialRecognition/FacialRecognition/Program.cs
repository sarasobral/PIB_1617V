using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading;

namespace FacialRecognition {
    public class Program {
        private static readonly String PATH1 = "..\\..\\..\\FaceImages\\";
        public static readonly String PATH2 = "..\\..\\..\\GroupElements\\";
        public static readonly String PATH3 = "..\\..\\..\\CaltechFaceDatabase\\";
        public static readonly String PATH4 = "..\\..\\..\\..\\WekaClassifier\\CaltechFaceDatabase.data";
        public static LinkedList<string> ALL_FEATURES = new LinkedList<string>();
        public static bool EXIT_AND_SAVE = false;

        public static void Main(string[] args)
        {
            String option;
            do
            {
                CleanUp();
                Console.Write("(a) Extrair caracteristicas\n" +
                    "(b) Correr o classificador sobre as images (dos elementos do grupo ou de CaltechFaceDatabase)\n" +
                    "(exit) para encerrar a aplicação\n");
                option = Console.ReadLine();
                if (option == "a") ChooseImages();
                else if (option == "b") FacialRecognition.Classifier.RunClassifier();
                else if (option == "exit") ExitAndSave();
            } while (true);
        }

        private static void ExitAndSave()
        {
            if (EXIT_AND_SAVE)
            {
                int partial = 21, etiqueta = 1, count = 1;
                System.IO.StreamWriter writer = new System.IO.StreamWriter(PATH4);
                foreach (string feature in ALL_FEATURES)
                {
                    if (count == partial)
                    {
                        etiqueta++;
                        count = 1;
                    }
                    string[] features = feature.Split(',');
                    string finalFeatures = features[features.Length - 2] + "," + etiqueta;
                    writer.WriteLine(finalFeatures);
                }
                writer.Close();
            }
            System.Environment.Exit(1);
        }

        private static void ChooseImages()
        {
            String option, queryString;
            do
            {
                CleanUp();
                Console.Write("(a) Extrair características das imagens de FaceImages\n" +
                    "(b) Extrair características de imagens dos elementos do grupo de trabalho ou de outras pessoas\n" +
                    "(c) Extrair características das imagens de CaltechFaceDatabase\n" +
                    "(home) para voltar ao início\n" +
                    "(exit) para encerrar a aplicação\n");
                option = Console.ReadLine();
                if (option == "home") return;
                else if (option == "exit") ExitAndSave();
                Console.Write("Extrair no formato (j)json ou (t)txt\n");
                bool json = false;
                if (Console.ReadLine() == "j") json = true;
                queryString = ChooseFeatures(); // Request parameters
                if (option == "a") MakeDetectRequestFor(PATH1, queryString, json, true);
                else if (option == "b") MakeDetectRequestFor(PATH2, queryString, json, true);
                else if (option == "c") { MakeDetectRequestFor(PATH3, queryString, json, true); EXIT_AND_SAVE = true; }

                Console.WriteLine("\n\n\nEspere pelos resultados ou vá à diretoria e consulte os ficheiro .txt gerados...\nDepois pressione  enter\n\n");
                Console.ReadLine();
            } while (true);
        }
        static int count = 0;
        private static void MakeDetectRequestFor(String path, String queryString, bool json, bool save)
        {
            String[] images = Directory.GetFiles(path, "*.jpg")
                .Select(Path.GetFileName)
                .ToArray();
            if (images.Length == 0)
                images = Directory.GetFiles(path, "*.bmp")
                    .Select(Path.GetFileName)
                    .ToArray();
            for (int i = 0; i < images.Length; )
            {
                FacialRecognition.ExtractFeatures.MakeDetectRequest(path + images[i], images[i], queryString, json, save);
                if (++i % 20 == 0)
                    Thread.Sleep(65000); // a api so aceita 20 pedidos por minuto
            }
        }

        private static String ChooseFeatures()
        {
            Console.Write("Escolha as caracteristicas desejadas com y ou n:\n");
            String answer, queryString = "returnFaceId=false";
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

        public static void CleanUp()
        {
            Console.Clear();
        }

    }
}
