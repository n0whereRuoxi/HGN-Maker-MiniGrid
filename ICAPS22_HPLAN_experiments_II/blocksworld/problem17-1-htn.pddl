( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b782 - block
    b957 - block
    b748 - block
    b726 - block
    b914 - block
    b49 - block
    b907 - block
    b479 - block
    b389 - block
    b411 - block
    b612 - block
    b254 - block
    b992 - block
    b820 - block
    b796 - block
    b105 - block
    b111 - block
    b14 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b782 )
    ( on b957 b782 )
    ( on b748 b957 )
    ( on b726 b748 )
    ( on b914 b726 )
    ( on b49 b914 )
    ( on b907 b49 )
    ( on b479 b907 )
    ( on b389 b479 )
    ( on b411 b389 )
    ( on b612 b411 )
    ( on b254 b612 )
    ( on b992 b254 )
    ( on b820 b992 )
    ( on b796 b820 )
    ( on b105 b796 )
    ( on b111 b105 )
    ( on b14 b111 )
    ( clear b14 )
  )
  ( :tasks
    ( Make-17Pile b957 b748 b726 b914 b49 b907 b479 b389 b411 b612 b254 b992 b820 b796 b105 b111 b14 )
  )
)
