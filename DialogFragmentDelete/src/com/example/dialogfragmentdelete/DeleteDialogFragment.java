package com.example.dialogfragmentdelete;

import android.app.DialogFragment;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.Toast;

public class DeleteDialogFragment extends DialogFragment implements OnClickListener
{

   Button buttonOk;
   Button buttonCancel;

   @Override
   public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstance)
   {
      View view = inflater.inflate(R.layout.dialogfragment, container, false);

      buttonCancel = (Button) view.findViewById(com.example.dialogfragmentdelete.R.id.buttonCancel);
      buttonCancel.setOnClickListener(this);

      buttonOk = (Button) view.findViewById(com.example.dialogfragmentdelete.R.id.buttonOK);
      buttonOk.setOnClickListener(this);
      return view;
   }

   @Override
   public void onClick(View v)
   {
      if (v == buttonCancel)
      {
         this.dismiss();
      }
      else if (v == buttonOk)
      {
         Toast.makeText(this.getActivity(), "Deleted", Toast.LENGTH_SHORT).show();
         this.dismiss();
      }
   }

}
