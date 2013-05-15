package com.example.wifidirectexample;

import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.IntentFilter;
import android.net.wifi.p2p.WifiP2pConfig;
import android.net.wifi.p2p.WifiP2pDevice;
import android.net.wifi.p2p.WifiP2pDeviceList;
import android.net.wifi.p2p.WifiP2pInfo;
import android.net.wifi.p2p.WifiP2pManager;
import android.net.wifi.p2p.WifiP2pManager.ActionListener;
import android.net.wifi.p2p.WifiP2pManager.Channel;
import android.net.wifi.p2p.WifiP2pManager.ChannelListener;
import android.net.wifi.p2p.WifiP2pManager.ConnectionInfoListener;
import android.net.wifi.p2p.WifiP2pManager.PeerListListener;
import android.os.Bundle;
import android.view.Menu;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.Toast;

public class MainActivity extends Activity implements ChannelListener, OnClickListener,
      PeerListListener, ConnectionInfoListener
{

   private WifiP2pManager     manager;
   private final IntentFilter intentFilter = new IntentFilter();
   private Channel            channel;
   private BroadcastReceiver  receiver     = null;
   private Button             buttonFind;
   private Button             buttonConnect;
   private WifiP2pDevice      device;

   @Override
   protected void onCreate(Bundle savedInstanceState)
   {
      super.onCreate(savedInstanceState);
      setContentView(R.layout.activity_main);
      manager = (WifiP2pManager) getSystemService(Context.WIFI_P2P_SERVICE);

      channel = manager.initialize(this, getMainLooper(), null);
      intentFilter.addAction(WifiP2pManager.WIFI_P2P_STATE_CHANGED_ACTION);
      intentFilter.addAction(WifiP2pManager.WIFI_P2P_PEERS_CHANGED_ACTION);
      intentFilter.addAction(WifiP2pManager.WIFI_P2P_CONNECTION_CHANGED_ACTION);
      intentFilter.addAction(WifiP2pManager.WIFI_P2P_THIS_DEVICE_CHANGED_ACTION);

      receiver = new WiFiDirectReceiver(manager, channel, this);
      registerReceiver(receiver, intentFilter);
      this.buttonConnect = (Button) this.findViewById(R.id.buttonConnect);
      this.buttonConnect.setOnClickListener(this);
      this.buttonFind = (Button) this.findViewById(R.id.buttonFind);
      this.buttonFind.setOnClickListener(this);
   }

   @Override
   public boolean onCreateOptionsMenu(Menu menu)
   {
      // Inflate the menu; this adds items to the action bar if it is present.
      getMenuInflater().inflate(R.menu.activity_main, menu);
      return true;
   }

   @Override
   public void onConnectionInfoAvailable(WifiP2pInfo info)
   {
      String infoname = info.groupOwnerAddress.toString();

   }

   @Override
   public void onPeersAvailable(WifiP2pDeviceList peers)
   {
      // TODO Auto-generated method stub
      for (WifiP2pDevice device : peers.getDeviceList())
      {
         this.device = device;
         break;
      }
   }

   @Override
   public void onClick(View v)
   {

      if (v == buttonConnect)
      {
         connect(this.device);
      }
      else if (v == buttonFind)
      {
         find();
      }
   }

   public void connect(WifiP2pDevice device)
   {
      WifiP2pConfig config = new WifiP2pConfig();

      if (device != null)
      {
         config.deviceAddress = device.deviceAddress;
         manager.connect(channel, config, new ActionListener()
         {

            @Override
            public void onFailure(int reason)
            {

            }

            @Override
            public void onSuccess()
            {

            }
         });

      }
      else
      {
         Toast.makeText(this, "device not found", Toast.LENGTH_SHORT).show();
      }
   }

   public void find()
   {
      manager.discoverPeers(channel,  new WifiP2pManager.ActionListener()
      {
         
         @Override
         public void onSuccess()
         {
            Toast.makeText(MainActivity.this, "finding peers", Toast.LENGTH_SHORT).show();
            
         }
         
         @Override
         public void onFailure(int reason)
         {
            Toast.makeText(MainActivity.this, "couldn't find peers", Toast.LENGTH_SHORT).show();
         }
      });
   }

   @Override
   public void onChannelDisconnected()
   {
      // TODO Auto-generated method stub

   }

}
