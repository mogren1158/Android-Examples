package com.example.fragmentbookexample;

import android.app.Activity;
import android.app.FragmentManager;
import android.app.FragmentTransaction;
import android.content.Intent;
import android.os.Bundle;
import android.view.Menu;

public class ActivityA extends Activity implements OnBookSelectedListener
{

   @Override
   protected void onCreate(Bundle savedInstanceState)
   {
      super.onCreate(savedInstanceState);
      setContentView(R.layout.activity_activity);
      
      addFragment();
   }
   
   public void addFragment()
   {
      FragmentManager fragmentManager = this.getFragmentManager();
      FragmentTransaction fragmentTransaction = fragmentManager.beginTransaction();
      
      FragmentA fragment = new FragmentA();
      fragmentTransaction.add(R.id.layout_activity_a, fragment);
      fragmentTransaction.commit();
   }

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
      String author = Book.GetAuthorNames()[bookIndex];
      Intent intent = new Intent(this.getApplicationContext(), ActivityB.class);
      intent.putExtra("author", author);
      startActivity(intent);
   }

}
