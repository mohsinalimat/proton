//
//  EditorViewDelegate.swift
//  Proton
//
//  Created by Rajdeep Kwatra on 9/1/20.
//  Copyright © 2020 Rajdeep Kwatra. All rights reserved.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import Foundation

/// Describes an object interested in listening to events raised from EditorView
public protocol EditorViewDelegate: AnyObject {

    /// Invoked when a special key like `enter`, `tab` etc. is intercepted in the `Editor`
    /// - Parameters:
    ///   - editor: Editor view receiving the event.
    ///   - key: Key that is intercepted.
    ///   - range: Range of the key in editor
    ///   - handled: Set to `true` to hijack the key press i.e. when `true`, the key press is not passed to the `Editor`
    func editor(_ editor: EditorView, didReceiveKey key: EditorKey, at range: NSRange, handled: inout Bool)

    /// Invoked when editor receives focus.
    /// - Parameters:
    ///   - editor:  Editor view receiving the event.
    ///   - range: Range where focus is received.
    func editor(_ editor: EditorView, didReceiveFocusAt range: NSRange)

    /// Invoked when editor loses the focus.
    /// - Parameters:
    ///   - editor:  Editor view receiving the event.
    ///   - range: Range from where focus is lost.
    func editor(_ editor: EditorView, didLoseFocusFrom range: NSRange)

    /// Invoked when text is changed in editor.
    /// - Parameters:
    ///   - editor:  Editor view receiving the event.
    ///   - range: Range where text is modified.
    func editor(_ editor: EditorView, didChangeTextAt range: NSRange)

    /// Invoked when the selection range changes in the editor as a result of moving the cursor using keys/mouse or taps.
    /// - Parameters:
    ///   - editor:  Editor view receiving the event.
    ///   - range: Range where selection is changed.
    ///   - attributes: Attributes at the updated range.
    ///   - contentType: Name of the content at the updated range.
    func editor(_ editor: EditorView, didChangeSelectionAt range: NSRange, attributes: [NSAttributedString.Key: Any], contentType: EditorContent.Name)

    /// Invoked when text processors are executed in the editor.
    /// - Parameters:
    ///   - editor:  Editor view receiving the event.
    ///   - processors: Processors that are executed.
    ///   - range: Range where processors are executed.
    func editor(_ editor: EditorView, didExecuteProcessors processors: [TextProcessing], at range: NSRange)
}

public extension EditorViewDelegate {
    func editor(_ editor: EditorView, didReceiveKey key: EditorKey, at range: NSRange, handled: inout Bool) { }
    func editor(_ editor: EditorView, didReceiveFocusAt range: NSRange) { }
    func editor(_ editor: EditorView, didLoseFocusFrom range: NSRange) { }
    func editor(_ editor: EditorView, didChangeTextAt range: NSRange) { }
    func editor(_ editor: EditorView, didChangeSelectionAt range: NSRange, attributes: [NSAttributedString.Key: Any], contentType: EditorContent.Name) { }
    func editor(_ editor: EditorView, didExecuteProcessors processors: [TextProcessing], at range: NSRange) { }
}
