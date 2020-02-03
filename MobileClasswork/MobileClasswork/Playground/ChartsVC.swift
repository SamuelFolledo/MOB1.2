//
//  ChartsVC.swift
//  MobileClasswork
//
//  Created by Macbook Pro 15 on 2/2/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import UIKit
import Charts

struct EEntry {
    var timestamp: Int
    var temperature: Double
}

class ChartsVC: UIViewController {
    
//MARK: Properties
    var dataEntries: [ChartDataEntry] = []
    var time: [Double] = [9,10,11,12,1,2,3,4,5,6]
    let prices: [Double] = [24.0, 39, 0.8, -10, -13, -25, -90, 50, 64, 32, 43]
    
//MARK: IBOutlets
    @IBOutlet weak var chartView: LineChartView!
    
//MARK: AppLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLineChart(values: prices)
        var entris: [EEntry] = []
        for i in 0..<prices.count {
            let entry = EEntry(timestamp: i+9, temperature: prices[i])
            entris.append(entry)
        }
        setChartView(entriesData: entris)
    }
    
    func setChartView(entriesData: [EEntry]) {
        var chartEntries: [ChartDataEntry] = []
        var xStrings: [String] = []
        let sortedentriesData = entriesData.sorted { (s1: EEntry, s2: EEntry) -> Bool in //sort by timestamp
            return s1.timestamp < s2.timestamp
        }
        for (i, entry) in sortedentriesData.enumerated() {
            let newEntry = ChartDataEntry(x: Double(i), y: entry.temperature)
            chartEntries.append(newEntry) //populate chartEntries - yAxis
//            let dateFormatter = DateFormatter()
//            dateFormatter.timeStyle = .medium
//            dateFormatter.dateStyle = .none
//            xStrings.append("\(dateFormatter.string(from: Date.init(timeIntervalSince1970: TimeInterval(entry.timestamp))))") //populate xAxis
            xStrings.append(String(entry.timestamp))
        }
        let set: LineChartDataSet = LineChartDataSet(entries: chartEntries, label: "°C")
        set.setColor(NSUIColor.blue, alpha: CGFloat(1))
        set.circleColors = [NSUIColor.blue]
        set.circleRadius = 3
        set.mode = LineChartDataSet.Mode.linear

        let data: LineChartData = LineChartData(dataSet: set)
//        self.chartView.xAxis.labelRotationAngle = -90 //tilts label
        self.chartView.xAxis.valueFormatter = DefaultAxisValueFormatter(block: {(index, _) in
            return xStrings[Int(index)]
        })
        self.chartView.xAxis.setLabelCount(xStrings.count, force: true)
        self.chartView.xAxis.labelPosition = .bottom //put xAxis labels at the bottom, default at top
        self.chartView.data = data
    }

    
    fileprivate func setupLineChart(values: [Double]) {
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
