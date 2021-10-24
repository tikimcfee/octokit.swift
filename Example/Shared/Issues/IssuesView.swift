//
//  IssuesView.swift
//  Example
//
//  Created by Piet Brauer-Kallenberg on 16.10.21.
//

import SwiftUI

struct IssuesView: View {
    @StateObject var viewModel: IssuesViewModel

    var body: some View {
        NetworkList(viewModel, error: $viewModel.error, searchText: $viewModel.searchText) { issue in
            NavigationLink(destination: IssueView(viewModel: IssueViewModel(repository: viewModel.repository, issue: issue))) {
                IssueRow(issue: issue)
            }
        }
        .navigationTitle("Issues")
    }
}