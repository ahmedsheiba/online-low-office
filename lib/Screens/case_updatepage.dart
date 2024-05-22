import 'package:flutter/material.dart';
import 'package:low_office/helper/constant.dart';
import 'package:low_office/helper/case_update.dart';

class CaseUbdate extends StatefulWidget {
  const CaseUbdate({Key? key}) : super(key: key);

  @override
  State<CaseUbdate> createState() => _CaseUbdate();
}

class _CaseUbdate extends State<CaseUbdate> {
  TextEditingController caseNameController = TextEditingController();
  TextEditingController caseNumberController = TextEditingController();
  TextEditingController caseAboutController = TextEditingController();
  List<Cases> cases = List.empty(growable: true);
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        shadowColor: Colors.black,
        title: Text(
          'Case Update',
          style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.bold,
              fontFamily: 'Pacifico'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            TextField(
              controller: caseNameController,
              decoration: InputDecoration(
                  hintText: 'Case Name',
                  hintStyle:
                      TextStyle(color: Theme.of(context).colorScheme.secondary),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.secondary),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ))),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: caseNumberController,
              keyboardType: TextInputType.number,
              maxLength: 10,
              decoration: InputDecoration(
                  hintText: 'Case Number',
                  hintStyle:
                      TextStyle(color: Theme.of(context).colorScheme.secondary),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.secondary),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ))),
            ),
            TextField(
              controller: caseAboutController,
              keyboardType: TextInputType.multiline,
              maxLength: 100,
              decoration: InputDecoration(
                  hintText: 'About Case',
                  hintStyle:
                      TextStyle(color: Theme.of(context).colorScheme.secondary),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.secondary),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ))),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      //
                      String casename = caseNameController.text.trim();
                      String caseNumber = caseNumberController.text.trim();
                      String caseAbout = caseAboutController.text.trim();
                      if (casename.isNotEmpty &&
                          caseNumber.isNotEmpty &&
                          caseAbout.isNotEmpty) {
                        setState(() {
                          caseNameController.text = '';
                          caseNumberController.text = '';
                          caseAboutController.text = '';
                          cases.add(Cases(
                              Cname: casename,
                              CNum: caseNumber,
                              Cabout: caseAbout));
                        });
                      }
                      //
                    },
                    child: const Text('Save')),
                ElevatedButton(
                    onPressed: () {
                      String casename = caseNameController.text.trim();
                      String caseNumber = caseNumberController.text.trim();
                      String caseAbout = caseAboutController.text.trim();
                      if (casename.isNotEmpty &&
                          caseNumber.isNotEmpty &&
                          caseAbout.isNotEmpty) {
                        setState(() {
                          caseNameController.text = '';
                          caseNumberController.text = '';
                          caseAboutController.text = '';
                          cases[selectedIndex].Cname = casename;
                          cases[selectedIndex].CNum = caseNumber;
                          cases[selectedIndex].Cabout = caseAbout;
                          selectedIndex = -1;
                        });
                      }
                    },
                    child: const Text('Update')),
              ],
            ),
            const SizedBox(height: 10),
            cases.isEmpty
                ? Text(
                    'No Case yet..',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 22),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: cases.length,
                      itemBuilder: (context, index) => getRow(index),
                    ),
                  )
          ],
        ),
      ),
    );
  }

  Widget getRow(int index) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor:
              index % 2 == 0 ? Colors.deepPurpleAccent : Colors.purple,
          foregroundColor: Colors.white,
          child: Text(
            cases[index].Cname[0],
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cases[index].Cname,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(cases[index].CNum),
            Text(cases[index].Cabout)
          ],
        ),
        trailing: SizedBox(
          width: 70,
          child: Row(
            children: [
              InkWell(
                  onTap: () {
                    //
                    caseNameController.text = cases[index].Cname;
                    caseNumberController.text = cases[index].CNum;
                    caseAboutController.text = cases[index].Cabout;
                    setState(() {
                      selectedIndex = index;
                    });
                    //
                  },
                  child: const Icon(Icons.edit)),
              InkWell(
                  onTap: (() {
                    //
                    setState(() {
                      cases.removeAt(index);
                    });
                    //
                  }),
                  child: const Icon(Icons.delete)),
            ],
          ),
        ),
      ),
    );
  }
}
