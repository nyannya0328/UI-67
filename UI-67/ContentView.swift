//
//  ContentView.swift
//  UI-67
//
//  Created by にゃんにゃん丸 on 2020/12/09.
//

import SwiftUI

struct ContentView: View {
    @State var selected = "Kavsoft"
    var color :Color = Color(#colorLiteral(red: 0.3716542769, green: 0.1682008497, blue: 1, alpha: 1))
    var color1 : Color = Color(#colorLiteral(red: 0.7517492593, green: 0.9240191194, blue: 0.1725517844, alpha: 1))
    var body: some View {
        ZStack{
            
            LinearGradient(gradient: .init(colors: [color,color1]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea(.all, edges: .all)
            
            VStack{
                Text(self.selected)
                    .font(.system(size: 50, weight: .heavy))
                    .foregroundColor(.white)
                    .background(
                    
                        LinearGradient(gradient: .init(colors: [color1,color]), startPoint: .bottomLeading, endPoint: .bottomTrailing)
                    )
                    .cornerRadius(10)
                    .padding(.top,30)
                
                    
                
                
                Spacer()
                CustomPicker(selected: $selected)
                Spacer()
                
                
                
            }
            .padding()
            
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CustomPicker : UIViewRepresentable {
    
    @Binding var selected : String
    func makeCoordinator() -> Coordinator {
        return CustomPicker.Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> UIPickerView {
        
        let view = UIPickerView()
        view.dataSource = context.coordinator
        view.delegate = context.coordinator
        return view
        
    }
    func updateUIView(_ uiView: UIPickerView, context: Context) {
        
    }
    
    class Coordinator : NSObject,UIPickerViewDelegate,UIPickerViewDataSource{
        
        var parent : CustomPicker
        
        init(parent:CustomPicker) {
            self.parent = parent
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return data.count
            
        }
        
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
        func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
            let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 150, height: 70))
            
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
            label.text = data[row]
            label.textColor = .darkGray
            label.textAlignment = .center
            label.font = .systemFont(ofSize: 35, weight: .heavy)
            
            view.backgroundColor = .clear
            view.addSubview(label)
            view.clipsToBounds = true
            view.layer.cornerRadius = view.bounds.height / 2.5
            view.layer.borderWidth = 5
            view.layer.borderColor = Color.white.cgColor
            
            return view
        }
        
        func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
            return UIScreen.main.bounds.width / 2
        }
        
        func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
            70
        }
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            self.parent.selected = data[row]
        }
        
        
        
    }
}

var data = ["Kavsoft","apple","12","12pro","M1","MacBookPro","Imac"]
