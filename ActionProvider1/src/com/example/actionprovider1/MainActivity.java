package com.example.actionprovider1;


import android.os.Bundle;
import android.app.Activity;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.Toast;

public class MainActivity extends Activity
{

   @Override
   protected void onCreate(Bundle savedInstanceState)
   {
      super.onCreate(savedInstanceState);
      setContentView(R.layout.activity_main);
   }

   @Override
   public boolean onCreateOptionsMenu(Menu menu)
   {
      // Inflate the menu; this adds items to the action bar if it is present.
      getMenuInflater().inflate(R.menu.activity_main, menu);
      return true;
   }

   @Override
   public boolean onOptionsItemSelected(MenuItem item)
   {
      boolean result = false;

      switch (item.getItemId())
      {
         case R.id.settings:
            Toast.makeText(this, "Settings Clicked", Toast.LENGTH_SHORT).show();
            result = true;
            break;
         case R.id.about:
            Toast.makeText(this, "About Clicked", Toast.LENGTH_SHORT).show();
            result = true;
            break;
         case R.id.thing1:
            Toast.makeText(this, "thing1 Clicked", Toast.LENGTH_SHORT).show();
            result = true;
            break;
         case R.id.thing2:
            Toast.makeText(this, "thing2 Clicked", Toast.LENGTH_SHORT).show();
            result = true;
            break;
         case R.id.thing3:
            Toast.makeText(this, "thing3 Clicked", Toast.LENGTH_SHORT).show();
            result = true;
            break;
         default:
            result = super.onOptionsItemSelected(item);
            break;
      }

      return result;
   }

}
