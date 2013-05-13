package com.example.actionview;

import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.MenuItem.OnActionExpandListener;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.Toast;

public class MainActivity extends Activity implements OnClickListener
{
   private Button largeButton;
   private Button mediumButton;
   private Button smallButton;
   private Menu   menu;

   @Override
   protected void onCreate(Bundle savedInstanceState)
   {
      super.onCreate(savedInstanceState);
      setContentView(R.layout.activity_main);
   }

   @Override
   public boolean onCreateOptionsMenu(Menu menu)
   {
      this.menu = menu;

      // Inflate the menu; this adds items to the action bar if it is present.
      getMenuInflater().inflate(R.menu.activity_main, menu);
      MenuItem size = menu.findItem(R.id.size);
      size.setOnActionExpandListener(new CustomActionListener(this));

      largeButton = (Button) size.getActionView().findViewById(R.id.largeButton);
      largeButton.setOnClickListener(this);

      mediumButton = (Button) size.getActionView().findViewById(R.id.mediumButton);
      mediumButton.setOnClickListener(this);

      smallButton = (Button) size.getActionView().findViewById(R.id.smallButton);
      smallButton.setOnClickListener(this);
      return true;
   }

   @Override
   public boolean onOptionsItemSelected(MenuItem item)
   {
      boolean result = false;

      switch (item.getItemId())
      {
         case R.id.size:
            Toast.makeText(this, "size pressed", Toast.LENGTH_SHORT).show();
            break;
         case R.id.about:
            Toast.makeText(this, "about pressed", Toast.LENGTH_SHORT).show();
            break;
         case R.id.settings:
            Toast.makeText(this, "settings pressed", Toast.LENGTH_SHORT).show();
            break;
      }
      return result;
   }

   @Override
   public void onClick(View v)
   {
      // TODO Auto-generated method stub
      if (v == largeButton)
      {
         Toast.makeText(this, "large pressed", Toast.LENGTH_LONG).show();
         menu.findItem(R.id.size).collapseActionView();
      }
      else if (v == mediumButton)
      {
         Toast.makeText(this, "medium pressed", Toast.LENGTH_LONG).show();
         menu.findItem(R.id.size).collapseActionView();

      }
      else if (v == smallButton)
      {
         Toast.makeText(this, "small pressed", Toast.LENGTH_LONG).show();
         menu.findItem(R.id.size).collapseActionView();
      }
   }

   public static class CustomActionListener implements OnActionExpandListener
   {
      private Context mContext = null;
      
      CustomActionListener(Context context)
      {
         mContext = context;
      }
      
      @Override
      public boolean onMenuItemActionCollapse(MenuItem item)
      {
         Toast.makeText(mContext, item.getTitle()+" button is collapsed", Toast.LENGTH_LONG).show();
            return true;
      }

      @Override
      public boolean onMenuItemActionExpand(MenuItem item)
      {
         Toast.makeText(mContext, item.getTitle()+" button is expanded", Toast.LENGTH_LONG).show();
               return true;
      }
   }

}
