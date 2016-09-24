//
//  AccordionEntriesStruct.swift
//  phraseBookApplication
//
//  Created by Bolat Ashim on 8/4/16.
//  Copyright © 2016 Bolat Ashim. All rights reserved.
//

import Foundation
import UIKit

struct AccordionEntriesStruct {
    let phrase: String
    let translation: String
    let transcription: String
    
    init(phrase: String, translation: String, transcription: String){
        self.phrase = phrase
        self.translation = translation
        self.transcription = transcription
    }
}
