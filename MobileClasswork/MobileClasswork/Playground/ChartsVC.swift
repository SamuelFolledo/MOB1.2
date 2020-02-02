//
//  ChartsVC.swift
//  MobileClasswork
//
//  Created by Macbook Pro 15 on 2/2/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import UIKit
import Charts

class ChartsVC: UIViewController {
    
//MARK: Properties
    var dataEntries: [ChartDataEntry] = []
    
//MARK: IBOutlets
    @IBOutlet weak var chartView: LineChartView!
    
//MARK: AppLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLineChart(values: [24.0, 39, 0.8, -10, 50, 64, 32, 43])
    }
    
    fileprivate func setupLineChart(values: [Double]) {
        chartView.noDataText = "No Data available"
        for i in 0..<values.count {
            print("chart point : \(values[i])")
            let dataEntry = ChartDataEntry(x: Double(i), y: values[i])
            dataEntries.append(dataEntry)
        }
        let line1 = LineChartDataSet(entries: dataEntries, label: "Units consumed")
        line1.colors = [.blue]
        line1.mode = .linear //cubic, horizontal, linear, stepped
        line1.cubicIntensity = 0.2
        
        let gradient = getGradientFilling()
        line1.fill = Fill.fillWithLinearGradient(gradient, angle: 90.0)
        line1.drawFilledEnabled = true
        
        let data = LineChartData()
        data.addDataSet(line1)
        chartView.data = data
        chartView.setScaleEnabled(false)
        chartView.animate(xAxisDuration: 1.5)
        chartView.drawGridBackgroundEnabled = false
        chartView.xAxis.drawAxisLineEnabled = false
        chartView.xAxis.drawGridLinesEnabled = false
        chartView.leftAxis.drawAxisLineEnabled = false
        chartView.leftAxis.drawGridLinesEnabled = false
        chartView.rightAxis.drawAxisLineEnabled = false
        chartView.rightAxis.drawGridLinesEnabled = false
        chartView.legend.enabled = false
        chartView.xAxis.enabled = false
        chartView.leftAxis.enabled = false
        chartView.rightAxis.enabled = false
        chartView.xAxis.drawLabelsEnabled = false
        
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
