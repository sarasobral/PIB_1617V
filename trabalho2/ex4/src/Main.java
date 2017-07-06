import java.io.*;
import java.net.URI;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import org.json.JSONArray;
import org.json.JSONObject;

import javax.management.Query;

public class Main {
    public static final String subscriptionKey = "f425b4a578164d4cb30e7585a536d527";
    public static final String uriBase = "https://westcentralus.api.cognitive.microsoft.com/face/v1.0/detect";
    private static final String path1 = "FaceImages\\";
    private static final String path2 = "RealFaceImages\\";
    private static final String[] bd_images = { "face1.bmp", "face2.bmp", "face3.bmp", "face4.bmp", "face5.bmp" };
    private static final String[] real_images = { "bebe.jpg", "george.jpg", "samuel.jpg", "sara.jpg" };
    private static BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

    public static void main(String[] args) throws IOException {
        String option;
        do {
            System.out.println("(a) Extrair caracteristicas\n"+
                    "(b) Identificar uma pessoa\n"+
                    "(exit) para encerrar a aplicação");
            option = br.readLine();
            if (option.equals("a")) { CleanUp(); ExtractFeatures(); }
            else if (option.equals("b")) { CleanUp(); RunClassifier(); }
            else if (option.equals("exit")) break;
        } while (true);
    }

    static void ExtractFeatures() throws IOException {
        String option;
        QueryString queryString;
        do {
            System.out.println("(a) Extrair características de uma base de dados especifica\n"+
                    "(b) Extrair características de imagens reais\n"+
                    "(c) Inserir um caminho à escolha\n"+
                    "(home) para voltar ao início\n"+
                    "(exit) para encerrar a aplicação");
            option = br.readLine();
            if (option.equals("home")) { CleanUp(); return; }
            else if (option.equals("exit")) System.exit(0);
            queryString = ChooseFeatures(); // Request parameters
            if (option.equals("a")) MakeDetectRequestFor(path1, bd_images, queryString);
            else if (option.equals("b")) MakeDetectRequestFor(path2, real_images, queryString);
            else {
                MakeDetectRequest("", option, queryString);
            }

            System.out.println("\n\n\nEspere pelos resultados ou vá à diretoria e consulte os ficheiro .txt gerados...\n\n\n");
            br.readLine();
        } while (true);
    }

    private static class QueryString{
        public String faceLandmarks = "false";
        public String faceAttributes = "false";
        public String queryString = null;
    }

    public static void MakeDetectRequestFor(String path, String[] images, QueryString queryString) {
        for (int i = 0; i < images.length; ++i)
            MakeDetectRequest(path + images[i], images[i], queryString);
    }

    public static QueryString ChooseFeatures() throws IOException {
        QueryString qstring = new QueryString();
        System.out.println("Escolha as caracteristicas desejadas com y ou n:\n");
        String answer, queryString = "";
        System.out.println("Face Landmarks ");
        answer = br.readLine();
        if (answer.equals("y")) qstring.faceLandmarks="true";
        System.out.println("Face Attributes ");
        answer = br.readLine();
        if (answer.equals("y")) {
            qstring.faceAttributes="true";
            System.out.println("Age ");
            answer = br.readLine();
            if (answer.equals("y")) queryString += "age";
            System.out.println("Gender ");
            answer = br.readLine();
            if (answer.equals("y")) queryString += ",gender";
            System.out.println("Head Pose ");
            answer = br.readLine();
            if (answer.equals("y")) queryString += ",headPose";
            System.out.println("Smile ");
            answer = br.readLine();
            if (answer.equals("y")) queryString += ",smile";
            System.out.println("Facial Hair ");
            answer = br.readLine();
            if (answer.equals("y")) queryString += ",facialHair";
            System.out.println("Glasses ");
            answer = br.readLine();
            if (answer.equals("y")) queryString += ",glasses";
            System.out.println("Emotion ");
            answer = br.readLine();
            if (answer.equals("y")) queryString += ",emotion";
            System.out.println("Hair ");
            answer = br.readLine();
            if (answer.equals("y")) queryString += ",hair";
            System.out.println("Makeup ");
            answer = br.readLine();
            if (answer.equals("y")) queryString += ",makeup";
            System.out.println("Occlusion ");
            answer = br.readLine();
            if (answer.equals("y")) queryString += ",occlusion";
            System.out.println("Accessories ");
            answer = br.readLine();
            if (answer.equals("y")) queryString += ",accessories";
            System.out.println("Blur ");
            answer = br.readLine();
            if (answer.equals("y")) queryString += ",blur";
            System.out.println("Exposure ");
            answer = br.readLine();
            if (answer.equals("y")) queryString += ",exposure";
            System.out.println("Noise ");
            answer = br.readLine();
            if (answer.equals("y")) queryString += ",noise";
        }
        return qstring;
    }

    public static void MakeDetectRequest(String path, String fileName, QueryString qString){
        HttpClient httpclient = new DefaultHttpClient();
        try {
            URIBuilder builder = new URIBuilder(uriBase);

            // Request parameters. All of them are optional.
            builder.setParameter("returnFaceId", "false");
            builder.setParameter("returnFaceLandmarks", qString.faceLandmarks);
            builder.setParameter("returnFaceAttributes", qString.faceAttributes);

            // Prepare the URI for the REST API call.
            URI uri = builder.build();
            HttpPost request = new HttpPost(uri);

            // Request headers.
            request.setHeader("Content-Type", "application/json");
            request.setHeader("Ocp-Apim-Subscription-Key", subscriptionKey);

            // Request body.
            StringEntity reqEntity = new StringEntity(path);
//            StringEntity reqEntity = new StringEntity("{\"url\":\"https://upload.wikimedia.org/wikipedia/commons/c/c3/RH_Louise_Lillian_Gish.jpg\"}");
            request.setEntity(reqEntity);

            // Execute the REST API call and get the response entity.
            HttpResponse response = httpclient.execute(request);
            HttpEntity entity = response.getEntity();

            if (entity != null) {
                // Format and display the JSON response.
                System.out.println("REST Response:\n");

                String jsonString = EntityUtils.toString(entity).trim();
                if (jsonString.charAt(0) == '[') {
                    JSONArray jsonArray = new JSONArray(jsonString);
                    System.out.println(jsonArray.toString(2));
                }
                else if (jsonString.charAt(0) == '{') {
                    JSONObject jsonObject = new JSONObject(jsonString);
                    System.out.println(jsonObject.toString(2));
                } else {
                    System.out.println(jsonString);
                }
            }
        }
        catch (Exception e) {
            // Display error message.
            System.out.println(e.getMessage());
        }
    }

    public static void RunClassifier() throws IOException {
        String option;
        do {
            System.out.println("(home) para voltar ao início\n" +
                    "(exit) para encerrar a aplicação\n");
            option = br.readLine();
            if (option == "home") { CleanUp();  return; }
            else if(option == "exit") System.exit(0);
        } while (true);
    }

    public static void CleanUp(){
        try {
            Runtime.getRuntime().exec("cls");
        } catch (IOException e) {
        }
    }
}