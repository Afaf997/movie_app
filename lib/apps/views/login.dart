import 'package:flutter/material.dart';
class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
        title: const Text('Log in',),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16,right: 16,top: 30),
          child: Column(
            children: [
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.android, 
                          size: 48,
                          color: Colors.red,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'App name',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                   const SizedBox(height: 20),
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration:const InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter your email',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                   const SizedBox(height: 16),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration:const InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter your password',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                   const SizedBox(height: 20,),
                   const Text("By logging in you're agreeing to our"),
                   const Text("Term & Privacy Policy and are at least 16 years old"),
                   const SizedBox(height: 40),
                 Container(
                        width: double.infinity, 
                        child: ElevatedButton(
                          onPressed: () async{
                           
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber[300],
                            padding:const EdgeInsets.all(16), 
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child:const Text(
                            'LOG IN',
                            style: TextStyle(fontSize: 20,color: Colors.white),
                            
                          ),
                        ),
                      ),
                  ],
                ),
              ),
             const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                    },
                    child:const Text('Forgot password?',style: TextStyle(fontSize:18,color: Colors.orange ),),
                  ),
                 const SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
          
                    },
                    child:const Text('Create Account',style: TextStyle(fontSize:18,color: Colors.orange )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}