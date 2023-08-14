//
//  HomeViewState.swift
//  RickAndMorty
//
//  Created Gabriel Chacon on 13/08/23.
//

public enum HomeViewState {
    case hasData(HomeViewEntity)
    case hasError(AlertViewEntity)
    case hasLoading(Bool)
    case isEmpty
}
