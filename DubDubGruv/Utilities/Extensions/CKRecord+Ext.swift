//
//  CKRecord+Ext.swift
//  DubDubGruv
//
//  Created by Alex Kolsa on 13.01.2022.
//

import CloudKit

extension CKRecord {
    func convertToDDGLocation() -> DDGLocation { DDGLocation.init(record: self) }
    func convertToDDGProfile() -> DDGProfile { DDGProfile.init(record: self) }
}
 
