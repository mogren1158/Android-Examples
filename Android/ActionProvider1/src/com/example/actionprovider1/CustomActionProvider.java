package com.example.actionprovider1;

import android.content.Context;
import android.view.ActionProvider;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Toast;

public class CustomActionProvider extends ActionProvider
{
   private Context mContext = null;

   public CustomActionProvider(Context context)
   {
      super(context);
      this.mContext = context;
   }

   @Override
   @Deprecated
   public View onCreateActionView()
   {
      LayoutInflater inflater = LayoutInflater.from(mContext);

      View view = inflater.inflate(R.layout.actionprovider, null);

      view.setOnClickListener(new OnClickListener()
      {

         @Override
         public void onClick(View v)
         {
            Toast.makeText(mContext, "Button was clicked", Toast.LENGTH_SHORT).show();
         }
      });

      return view;
   }

   @Override
   public View onCreateActionView(MenuItem item)
   {
      return this.onCreateActionView();
   }

   @Override
   public boolean onPerformDefaultAction()
   {
      //Toast.makeText(mContext, "onPerformDefaultAction", Toast.LENGTH_SHORT).show();
      return true;
   }

}
