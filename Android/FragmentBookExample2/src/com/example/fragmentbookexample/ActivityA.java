package com.example.fragmentbookexample;


import android.app.Activity;
import android.app.Fragment;
import android.app.FragmentManager;
import android.content.Intent;
import android.os.Bundle;
import android.view.Menu;
import android.widget.TextView;

public class ActivityA extends Activity implements OnBookSelectedListener
{

   @Override
   protected void onCreate(Bundle savedInstanceState)
   {
      super.onCreate(savedInstanceState);
      setContentView(R.layout.activity_activity);
      
      //addFragment();
      
   }
   
   /*
   public void addFragment()
   {
      FragmentManager fragmentManager = this.getFragmentManager();
      FragmentTransaction fragmentTransaction = fragmentManager.beginTransaction();
      
      FragmentA fragment = new FragmentA();
      fragmentTransaction.add(R.id.layout_activity_a, fragment);
      fragmentTransaction.commit();
   }*/

   @Override
   public boolean onCreateOptionsMenu(Menu menu)
   {
      // Inflate the menu; this adds items to the action bar if it is present.
      getMenuInflater().inflate(R.menu.activity_activity, menu);
      return true;
   }

   @Override
   public void onBookSelected(int bookIndex)
   {
      FragmentManager fragmentManager = getFragmentManager();
      
      Fragment fragmentB = fragmentManager.findFragmentById(R.id.fragmentb);

      String author = Book.GetAuthorNames()[bookIndex];
      if(fragmentB == null)
      {
         Intent intent = new Intent(this.getApplicationContext(), ActivityB.class);
         intent.putExtra("author", author);
         startActivity(intent);
      }
      else
      {
         TextView view = (TextView)fragmentB.getView().findViewById(R.id.textViewAuthor);
         view.setText(author);
      }
   }

}
