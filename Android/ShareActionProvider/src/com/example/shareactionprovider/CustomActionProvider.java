package com.example.shareactionprovider;


import android.content.Context;
import android.util.Log;
import android.view.ActionProvider;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.MenuItem.OnMenuItemClickListener;
import android.view.SubMenu;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Toast;

public class CustomActionProvider extends ActionProvider implements OnMenuItemClickListener
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
      Log.v("CustomActionProvider", "onCreateActionView");
      
      /*LayoutInflater inflater = LayoutInflater.from(mContext);

      View view = inflater.inflate(R.layout.actionprovider, null);

      view.setOnClickListener(new OnClickListener()
      {

         @Override
         public void onClick(View v)
         {
            Toast.makeText(mContext, "Button was clicked", Toast.LENGTH_SHORT).show();
            Log.v("CusomActionProvider", "ButtonWasClicked");
         }
      });

      return view;*/
      return null;
   }

   @Override
   public View onCreateActionView(MenuItem item)
   {
      return this.onCreateActionView();
   }

   @Override
   public boolean onPerformDefaultAction()
   {
      Toast.makeText(mContext, "onPerformDefaultAction", Toast.LENGTH_SHORT).show();
      Log.v("CusomActionProvider", "onPerformDefaultAction");
      return true;
   }

   @Override
   public void onPrepareSubMenu(SubMenu subMenu)
   {
      subMenu.clear();
      
      subMenu.add("Test1").setOnMenuItemClickListener(this);
   }

   @Override
   public boolean onMenuItemClick(MenuItem item)
   {
      Toast.makeText(mContext, "sub item clicked", Toast.LENGTH_SHORT).show();
      return true;
   }
   
   @Override
   public boolean hasSubMenu()
   {
      return true;
   }
}
