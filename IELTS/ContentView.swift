//
//  ContentView.swift
//  TestLongTextScrollView
//
//  Created by hai on 12/2/21.
//  Copyright © 2021 biorithm. All rights reserved.
//

import SwiftUI


let content = "1 As you can see, I'm really struggling to create a simple multi-line Text. The closest I got so far is putting it in a List instead of a ScrollView, but then I get a line under the text. As you can see, I'm really struggling to create a simple multi-line Text. The closest I got so far is putting it in a List instead of a ScrollView, but then I get a line under the text. As you can see, I'm really struggling to create a simple multi-line Text. The closest I got so far is putting it in a List instead of a ScrollView, but then I get a line under the text. As you can see, I'm really struggling to create a simple multi-line Text. The closest I got so far is putting it in a List instead of a ScrollView, but then I get a line under the text. As you can see, I'm really struggling to create a simple multi-line Text. The closest I got so far is putting it in a List instead of a ScrollView, but then I get a line under the text. 1 As you can see, I'm really struggling to create a simple multi-line Text. The closest I got so far is putting it in a List instead of a ScrollView, but then I get a line under the text. As you can see, I'm really struggling to create a simple multi-line Text. The closest I got so far is putting it in a List instead of a ScrollView, but then I get a line under the text. As you can see, I'm really struggling to create a simple multi-line Text. The closest I got so far is putting it in a List instead of a ScrollView, but then I get a line under the text. As you can see, I'm really struggling to create a simple multi-line Text. The closest I got so far is putting it in a List instead of a ScrollView, but then I get a line under the text. As you can see, I'm really struggling to create a simple multi-line Text. The closest I got so far is putting it in a List instead of a ScrollView, but then I get a line under the text. 1 As you can see, I'm really struggling to create a simple multi-line Text. The closest I got so far is putting it in a List instead of a ScrollView, but then I get a line under the text. As you can see, I'm really struggling to create a simple multi-line Text. The closest I got so far is putting it in a List instead of a ScrollView, but then I get a line under the text. As you can see, I'm really struggling to create a simple multi-line Text. The closest I got so far is putting it in a List instead of a ScrollView, but then I get a line under the text. As you can see, I'm really struggling to create a simple multi-line Text. The closest I got so far is putting it in a List instead of a ScrollView, but then I get a line under the text. As you can see, I'm really struggling to create a simple multi-line Text. The closest I got so far is putting it in a List instead of a ScrollView, but then I get a line under the text. 1 As you can see, I'm really struggling to create a simple multi-line Text. The closest I got so far is putting it in a List instead of a ScrollView, but then I get a line under the text. As you can see, I'm really struggling to create a simple multi-line Text. The closest I got so far is putting it in a List instead of a ScrollView, but then I get a line under the text. As you can see, I'm really struggling to create a simple multi-line Text. The closest I got so far is putting it in a List instead of a ScrollView, but then I get a line under the text. As you can see, I'm really struggling to create a simple multi-line Text. The closest I got so far is putting it in a List instead of a ScrollView, but then I get a line under the text. As you can see, I'm really struggling to create a simple multi-line Text. The closest I got so far is putting it in a List instead of a ScrollView, but then I get a line under the text."

struct Question {
    var question: String
    var optionA: String
    var optionB: String
    var optionC: String
    var optionD: String
    var selected: Int = -1
}

class QuestionModel: ObservableObject {
    @Published var questions: [Question] = [
        Question(question: "What is the highest paid programming language in the world in 2021? What is the highest paid programming language in 2021?", optionA: "C", optionB: "C++", optionC: "Python", optionD: "Swift"),
        Question(question: "What is the highest paid programming language in the world in 2022", optionA: "C", optionB: "C++", optionC: "Python", optionD: "Swift"),
        Question(question: "What is the highest paid programming language in the world in 2023", optionA: "C", optionB: "C++", optionC: "Python", optionD: "Swift"),
        Question(question: "What is the highest paid programming language in the world in 2024", optionA: "C", optionB: "C++", optionC: "Python", optionD: "Swift"),
        Question(question: "What is the highest paid programming language in the world in 2025", optionA: "C", optionB: "C++", optionC: "Python", optionD: "Swift")
    ]
}

struct QuestionScrollView :View {
    @Binding var questionViewHeight: CGFloat
    var body: some View {
        ScrollView(.horizontal){
            HStack{
                ForEach(0..<5){index in
                    HStack {
                        Button(action: {
                            self.questionViewHeight = UIScreen.main.bounds.height / 20
                        }){
                            Text("Hide")
                        }
                        Button(action: {
                            self.questionViewHeight = UIScreen.main.bounds.height / 3
                        }){
                            Text("Show")
                        }
                        Text("QuestionView")
                    }
                    .frame(width: UIScreen.main.bounds.width)
                    .frame(height: self.questionViewHeight)
                    .background(Color.green.opacity(1.0))
                }
            }
        }
        
    }
}

struct OptionRowView : View {
    @Binding var selected: Int
    var index: Int
    
    var body: some View {
        HStack{
            Text("Option \(index)")
            Spacer()
        }
        .padding()
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(self.selected == self.index ? Color.green : Color.white)
        .cornerRadius(8)
        .onTapGesture {
            self.selected = self.index
        }
    }
}

struct QuestionView :View {
    @State var isCollapse: Bool = false
    @State var selectedOption: Int = -1
    @State var currentIndex: Int = 0
    @ObservedObject var sot = QuestionModel()
    
    var body: some View {
        VStack{
            HStack(){
                Button(action:{
                    self.prevQuestion()
                }){
                    Image(systemName: "arrowtriangle.left.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 20)
                        .foregroundColor(Color.white)
                }
                Spacer()
                Button(action:{
                    self.isCollapse.toggle()
                }){
                    Image(systemName: self.isCollapse ? "arrowtriangle.up.fill" : "arrowtriangle.down.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 20)
                        .foregroundColor(Color.white)
                }
                Spacer()
                Button(action:{
                    self.nextQuestion()
                }){
                    Image(systemName: "arrowtriangle.right.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 20)
                        .foregroundColor(Color.white)
                }
            }
            .padding()
                //            .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(Color.purple)
            
            Spacer(minLength: 0)
            
            Group(){
                if self.isCollapse {
                    EmptyView()
                } else {
                    List{
                        Section(header: Text(self.sot.questions[self.currentIndex].question)) {
                            ForEach(0..<4){index in
                                OptionRowView(selected: self.$sot.questions[self.currentIndex].selected, index: index)
                            }
                            .listRowBackground(Color.white)
                        }
                    }
                    .padding(.top,0)
                }
            }
            
            Spacer()
        }
            //        .frame(maxWidth: .infinity)
            .frame(height: self.isCollapse ? 0 : UIScreen.main.bounds.height / 2.5)
            .background(Color.white)
    }
    
    func nextQuestion(){
        self.currentIndex = (self.currentIndex + 1) < self.sot.questions.count ? self.currentIndex + 1 : 0
    }
    
    func prevQuestion(){
        self.currentIndex = (self.currentIndex - 1) > -1 ? self.currentIndex - 1 : self.sot.questions.count - 1
    }
}


struct ReadingView: View {
    var body: some View {
        GeometryReader {width in
            ZStack{
                ScrollView{
                    Text(content)
                }
                .padding()
                VStack{
                    Spacer()
                    QuestionView()
                }
                //                .padding()
            }
            //                        .padding([.top, .bottom])
        }
    }
}

struct ContentView : View {
    var body: some View {
        ReadingView()
        //        TestListView()
    }
}
