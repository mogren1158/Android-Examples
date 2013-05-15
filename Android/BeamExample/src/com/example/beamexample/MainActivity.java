package com.example.beamexample;

import java.io.ByteArrayOutputStream;
import java.nio.charset.Charset;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.nfc.NdefMessage;
import android.nfc.NdefRecord;
import android.nfc.NfcAdapter;
import android.nfc.NfcAdapter.CreateNdefMessageCallback;
import android.nfc.NfcEvent;
import android.os.Bundle;
import android.os.Parcelable;
import android.view.Menu;
import android.widget.ImageView;
import android.widget.TextView;

public class MainActivity extends Activity implements CreateNdefMessageCallback
{

   NfcAdapter mNfcAdapter;
   TextView   mInfoText;
   ImageView  mImageView;

   @Override
   protected void onCreate(Bundle savedInstanceState)
   {
      super.onCreate(savedInstanceState);
      setContentView(R.layout.activity_main);

      mImageView = (ImageView) findViewById(R.id.imageView);
      mInfoText = (TextView) findViewById(R.id.textView);
      mNfcAdapter = NfcAdapter.getDefaultAdapter(getApplicationContext());

      if (mNfcAdapter == null)
      {
         mInfoText.setText("NFC is not available on this device");
      }
      else
      {
         mNfcAdapter.setNdefPushMessageCallback(this, this);
      }
   }

   @Override
   public void onResume()
   {
      super.onResume();
      if (NfcAdapter.ACTION_NDEF_DISCOVERED.equals(getIntent().getAction()))
      {
         this.processIntent(getIntent());
      }
   }

   @Override
   public void onNewIntent(Intent intent)
   {
      setIntent(intent);
   }

   public void processIntent(Intent intent)
   {
      Parcelable[] rawMsgs = intent.getParcelableArrayExtra(NfcAdapter.EXTRA_NDEF_MESSAGES);

      // only one message sent during the beam
      NdefMessage msg = (NdefMessage) rawMsgs[0];
      // record 0 contains the MIME type, record 1 is the AAR 
      byte[] bytes = msg.getRecords()[0].getPayload();

      Bitmap bmp = BitmapFactory.decodeByteArray(bytes, 0, bytes.length);
      mImageView.setImageBitmap(bmp);
   }

   @Override
   public boolean onCreateOptionsMenu(Menu menu)
   {
      // Inflate the menu; this adds items to the action bar if it is present.
      // getMenuInflater().inflate(R.menu.activity_main, menu);
      return false;
   }

   @Override
   public NdefMessage createNdefMessage(NfcEvent event)
   {
      Bitmap icon = BitmapFactory.decodeResource(this.getResources(), R.drawable.ic_launcher);
      ByteArrayOutputStream stream = new ByteArrayOutputStream();
      icon.compress(Bitmap.CompressFormat.PNG, 100, stream);
      byte[] byteArray = stream.toByteArray();

      NdefMessage msg = new NdefMessage(new NdefRecord[] {
            this.createMimeRecord("application/com.example", byteArray),
            NdefRecord.createApplicationRecord("com.example") });
      return msg;
   }

   public NdefRecord createMimeRecord(String mimeType, byte[] payload)
   {
      byte[] mimeBytes = mimeType.getBytes(Charset.forName("US-ASCII"));
      NdefRecord mimeRecord = new NdefRecord(NdefRecord.TNF_MIME_MEDIA, mimeBytes, new byte[0],
            payload);

      return mimeRecord;
   }

}
