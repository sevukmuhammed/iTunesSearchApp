//
//  DetailPageViewController+TableView.swift
//  SearchApp
//
//  Created by Muhammed Sevük on 31.01.2021.
//

import Foundation
import RxDataSources
import Differentiator
import RxSwift
import Reusable
import RxCocoa

extension DetailPageViewController: UITableViewDelegate {
    internal func initializeTableView() {
        tableView
            .rx
            .setDelegate(self)
            .disposed(by: disposeBag)
        
        registerCells()
        
        viewModel
            .sections
            .asObservable()
            .bind(to: tableView.rx.items(dataSource: dataSource()))
            .disposed(by: disposeBag)
    }
    
    private func registerCells() {
        tableView.register(cellType: MovieCell.self)
        tableView.register(cellType: SongCell.self)
        tableView.register(cellType: SoftwareCell.self)
        tableView.register(cellType: BookCell.self)
    }
    
    public func setupTableViewDataBinding(data: Item, type: DetailPageTypes) {
        viewModel.getData(data: data, type: type)
    }
    
    internal func dataSource() -> RxTableViewSectionedReloadDataSource<DetailPageSectionModel> {
        return RxTableViewSectionedReloadDataSource<DetailPageSectionModel>(
            configureCell: { dataSource, tableView, indexPath, item in
                switch dataSource[indexPath] {
                case .MovieSectionItem(let data):
                    let cell = tableView.dequeueReusableCell(for: indexPath,cellType: MovieCell.self)
                    cell.cellData = data
                    cell.selectionStyle = .none
                    return cell
                case .SongSectionItem(data: let data):
                    let cell = tableView.dequeueReusableCell(for: indexPath, cellType: SongCell.self)
                    cell.cellData = data
                    cell.selectionStyle = .none
                    return cell
                case .SoftwareSectionItem(data: let data):
                    let cell = tableView.dequeueReusableCell(for: indexPath, cellType: SoftwareCell.self)
                    cell.cellData = data
                    cell.selectionStyle = .none
                    return cell
                case .BookSectionItem(data: let data):
                    let cell = tableView.dequeueReusableCell(for: indexPath, cellType: BookCell.self)
                    cell.cellData = data
                    cell.selectionStyle = .none
                    return cell
                }
        })
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.sections.value[indexPath.first!].estimatedHeight
    }
}
