package pollens.poupa.beaujean.com.pollens;

import android.content.Context;
import android.content.SharedPreferences;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.Date;

import static android.content.Context.MODE_PRIVATE;

/**
 * Created by Adrien on 25/04/2017.
 */

public class FeedDB {
    DBHelper dbHelper;
    Context context;
    public FeedDB(final Context context) {
        dbHelper = new DBHelper(context);
        dbHelper.getWritableDatabase();
    }

    public void loadDepartments() {
        this.context = context;

        RequestQueue mVolleyQueue = Volley.newRequestQueue(context.getApplicationContext());
        String url = "http://pollens.poupa.fr/api/department";
        StringRequest stringRequest = new StringRequest(Request.Method.GET, url, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                try {
                    dbHelper.delete();
                    JSONObject jsonObject = new JSONObject(response);
                    JSONArray departments = jsonObject.getJSONArray("departments");

                    for (int i = 0; i < departments.length(); i++) {
                        JSONObject row = departments.getJSONObject(i);

                        String name = row.getString("name");
                        String number = row.getString("number");
                        String risk = row.getString("risk");
                        String color = row.getString("color");

                        dbHelper.insertDepartment(name, number, Integer.parseInt(risk), color);
                    }

                    // Store last check
                    SharedPreferences pref = context.getApplicationContext().getSharedPreferences("lastcheck", MODE_PRIVATE);
                    SharedPreferences.Editor editor = pref.edit();
                    editor.remove("lastcheck");
                    editor.putString("lastcheck", new Date().toString());
                    editor.apply();

                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                error.printStackTrace();
            }
        });
        stringRequest.setShouldCache(false);
        stringRequest.setTag("Volley");
        mVolleyQueue.add(stringRequest);
    }
}
