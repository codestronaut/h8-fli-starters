import 'package:flutter/material.dart';

class NfcPollView extends StatelessWidget {
  const NfcPollView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),

          // TODO: 1. Wrap this widget tree with the BlocBuilder.
          child: Column(
            spacing: 16.0,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FilledButton(
                onPressed: () {
                  // TODO: 2. Call a bloc event to start read the NFC tag.
                },
                child: Text('Read NFC'),
              ),
              Text('Status...'),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.brown),
                  color: Colors.brown.shade50,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'NFC Tag Metadata',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                    Divider(height: 0.0, color: Colors.brown),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      // TODO: 3. Display the detected NFC metadata.
                      child: Text('Data not found'),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.brown),
                  color: Colors.brown.shade50,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'NFC Tag NDEF Data',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                    Divider(height: 0.0, color: Colors.brown),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      // TODO: 4. Display the detected NFC NDEF data.
                      child: Text('Data not found'),
                    ),
                  ],
                ),
              ),

              /// MARK: Notes
              /// Write NFC button should be visible only then the NFC tag
              /// has NDEF records to write data.
              FilledButton(
                onPressed: () {
                  // TODO: 5. Call a bloc event to start write data to NFC tag.
                },
                child: Text('Write NFC'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
