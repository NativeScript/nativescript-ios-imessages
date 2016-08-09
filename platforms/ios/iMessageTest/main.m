#include <Foundation/Foundation.h>
#include <JavaScriptCore/JavaScriptCore.h>
#include <NativeScript/NativeScript.h>
#include <TNSExceptionHandler.h>

TNSRuntime* runtime;

__attribute__((constructor))
void initialize() {
    extern char startOfMetadataSection __asm(
                                             "section$start$__DATA$__TNSMetadata");
    [TNSRuntime initializeMetadata:&startOfMetadataSection];
    
    runtime = [[TNSRuntime alloc] initWithApplicationPath:[NSBundle mainBundle].bundlePath];
    TNSRuntimeInspector.logsToSystemConsole = YES;
    [runtime executeModule:@"./MessagesMainController"];
}
