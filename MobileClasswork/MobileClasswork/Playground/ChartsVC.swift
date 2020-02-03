//
//  ChartsVC.swift
//  MobileClasswork
//
//  Created by Macbook Pro 15 on 2/2/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import UIKit
import Charts

struct Stock {
    var timestamp: Int
    var price: Double
}

class ChartsVC: UIViewController {
    
//MARK: Properties
    var dataEntries: [ChartDataEntry] = []
    var time: [Double] = [9,10,11,12,1,2,3,4,5,6]
    let timeStamps: [Int] = [9, 10, 11, 12, 1, 2, 3, 4, 5, 6]
    let timeStamps5: [String] = ["9:00", "9:05", "9:10", "9:15", "9:20", "9:25", "9:30", "9:35", "9:40", "9:45", "9:50", "9:55", "10:00",  "10:05", "10:10", "10:15", "10:20", "10:25", "10:30", "10:35", "10:40", "10:45", "10:50", "10:55", "11:00", "11:05", "11:10", "11:15", "11:20", "11:25", "11:30", "11:35", "11:40", "11:45",  "11:50", "11:55", "12:00", "12:05", "12:10", "12:15", "12:20", "12:25", "12:30", "12:35", "12:40", "12:45", "12:50", "12:55","1:00", "1:05", "1:10", "1:15", "1:20", "1:25", "1:30", "1:35", "1:40", "1:45", "1:50", "1:55", "2:00", "2:05", "2:10", "2:15", "2:20", "2:25", "2:30", "2:35", "2:40", "2:45", "2:50", "2:55", "3:00", "3:05", "3:10", "3:15", "3:20", "3:25", "3:30", "3:35", "3:40", "3:45", "3:50", "3:55", "4:00", "4:05", "4:10", "4:15", "4:20", "4:25", "4:30", "4:35", "4:40", "4:45", "4:50", "4:55", "5:00", "5:05", "5:10", "5:15", "5:20", "5:25", "5:30", "5:35", "5:40", "5:45", "5:50", "5:55", "6:00"]
    let prices: [Double] = [24.0, 39, 0.8, -10, -13, -25, -90, 50, 64, 32, 43]
    
//MARK: IBOutlets
    @IBOutlet weak var chartView: LineChartView!
    
//MARK: AppLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLineChart(values: prices)
        var stocks: [Stock] = []
        for i in 0..<prices.count {
            let stock = Stock(timestamp: i+9, price: prices[i])
            stocks.append(stock)
        }
        setChartView(entriesData: stocks)
    }
    
    func setChartView(entriesData: [Stock]) { //version 2
        var chartEntries: [ChartDataEntry] = []
        var xStrings: [String] = []
        let sortedentriesData = entriesData.sorted { (s1: Stock, s2: Stock) -> Bool in //sort by timestamp
            return s1.timestamp < s2.timestamp
        }
        for (i, stock) in sortedentriesData.enumerated() {
            let newStock = ChartDataEntry(x: Double(i), y: stock.price)
            chartEntries.append(newStock) //populate chartEntries - yAxis
//            let dateFormatter = DateFormatter()
//            dateFormatter.timeStyle = .medium
//            dateFormatter.dateStyle = .none
//            xStrings.append("\(dateFormatter.string(from: Date.init(timeIntervalSince1970: TimeInterval(entry.timestamp))))") //populate xAxis
            xStrings.append(String(stock.timestamp))
        }
        let set: LineChartDataSet = LineChartDataSet(entries: chartEntries, label: "°C")
        set.setColor(NSUIColor.blue, alpha: CGFloat(1))
        set.circleColors = [NSUIColor.blue]
        set.circleRadius = 3
        set.mode = LineChartDataSet.Mode.linear

        let data: LineChartData = LineChartData(dataSet: set)
//        self.chartView.xAxis.labelRotationAngle = -90 //tilts label
        self.chartView.xAxis.valueFormatter = DefaultAxisValueFormatter(block: { (index, axis) -> String in
            print("Index = \(index) --- Axis \(axis)")
            return String(self.timeStamps5[Int(index)])
        })
        self.chartView.xAxis.valueFormatter = DefaultAxisValueFormatter(block: {(index, _) in
            return String(self.timeStamps5[Int(index)])
        })
        self.chartView.xAxis.setLabelCount(timeStamps5.count, force: true)
        self.chartView.xAxis.labelPosition = .bottom //put xAxis labels at the bottom, default at top
        self.chartView.data = data
    }

    
    fileprivate func setupLineChart(values: [Double]) {//version 1
        chartView.noDataText = "No Data available"
        for i in 0..<values.count {
            print("chart point : \(values[i])")
//            let dataEntry = ChartDataEntry(x: Double(i), y: values[i])
            let dataEntryy = ChartDataEntry(x: Double(i), y: values[i], icon: nil, data: nil)
            dataEntries.append(dataEntryy)
        }
        let lineDataSet = LineChartDataSet(entries: dataEntries, label: "Stock Price")
        lineDataSet.colors = [.blue]
        lineDataSet.mode = .linear //cubic, horizontal, linear, stepped
        lineDataSet.cubicIntensity = 0.2
        
        let gradient = getGradientFilling()
        lineDataSet.fill = Fill.fillWithLinearGradient(gradient, angle: 90.0)
        lineDataSet.drawFilledEnabled = true
        let data = LineChartData()
        data.addDataSet(lineDataSet)
        
//        self.chartView.xAxis.valueFormatter = DefaultAxisValueFormatter(block: {(index, _) in
//            return String(self.time[Int(index)])
//        })
//        self.chartView.xAxis.setLabelCount(time.count, force: true)
//        self.chartView.xAxis.labelPosition = .bottom //put xAxis labels at the bottom, default at top
//        self.chartView.data = data
        
        chartView.data = data
        
        
//        chartView.setScaleEnabled(false)
//        chartView.animate(xAxisDuration: 1.5)
//        chartView.drawGridBackgroundEnabled = false
////        chartView.xAxis.drawAxisLineEnabled = false
////        chartView.xAxis.drawGridLinesEnabled = false
//        chartView.leftAxis.drawAxisLineEnabled = false
//        chartView.leftAxis.drawGridLinesEnabled = false
//        chartView.rightAxis.drawAxisLineEnabled = false
//        chartView.rightAxis.drawGridLinesEnabled = false
//        chartView.legend.enabled = false
////        chartView.xAxis.enabled = false
//        chartView.leftAxis.enabled = false
//        chartView.rightAxis.enabled = false
////        chartView.xAxis.drawLabelsEnabled = false //draws value of xAxis
        
    }
    
    /// Gradient for filling space under the line chart
    func getGradientFilling() -> CGGradient {
        let topColor = UIColor(red: 141/255, green: 133/255, blue: 22/255, alpha: 1).cgColor
        let btmColor = UIColor(red: 230/255, green: 155/255, blue: 210/255, alpha: 1).cgColor
        let gradientColors = [topColor, btmColor] as CFArray
        let colorLocations: [CGFloat] = [0.7,0.5]
        return CGGradient(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: gradientColors, locations: colorLocations)!
    }
    
}
