//
//  LozalizableProjectStrings.swift
//  aLodjinha
//
//  Created by Saulo Costa on 26/05/19.
//  Copyright © 2019 Saulo. All rights reserved.
//

import Foundation

enum ProductStrings: String, Localizable {
    case originalValue = "De: %@"
    case newValue = "Por: %@"
}

enum HomeStrings: String, Localizable {
    case title = "Home"
    case categoryTitle = "Categorias"
    case topSaleTitle = "Mais vendidos"
}

enum CategoryProductsStrings: String, Localizable {
    case backButtonTitle = "Voltar"
}

enum ProductDetailStrings: String, Localizable {
    case reservationDialogTitle = "Produto reservado com sucesso"
    case reservationDialogButtonTitle = "OK"
}

enum EmptyStateStrings: String, Localizable {
    case message = "Não foram encontrados\n nenhum item."
}
