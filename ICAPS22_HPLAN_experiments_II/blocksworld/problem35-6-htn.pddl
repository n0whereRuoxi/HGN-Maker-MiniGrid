( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b58 - block
    b853 - block
    b407 - block
    b421 - block
    b414 - block
    b574 - block
    b790 - block
    b858 - block
    b203 - block
    b937 - block
    b371 - block
    b113 - block
    b464 - block
    b486 - block
    b550 - block
    b287 - block
    b774 - block
    b254 - block
    b425 - block
    b602 - block
    b419 - block
    b162 - block
    b896 - block
    b90 - block
    b530 - block
    b728 - block
    b218 - block
    b838 - block
    b899 - block
    b536 - block
    b472 - block
    b390 - block
    b971 - block
    b952 - block
    b413 - block
    b866 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b58 )
    ( on b853 b58 )
    ( on b407 b853 )
    ( on b421 b407 )
    ( on b414 b421 )
    ( on b574 b414 )
    ( on b790 b574 )
    ( on b858 b790 )
    ( on b203 b858 )
    ( on b937 b203 )
    ( on b371 b937 )
    ( on b113 b371 )
    ( on b464 b113 )
    ( on b486 b464 )
    ( on b550 b486 )
    ( on b287 b550 )
    ( on b774 b287 )
    ( on b254 b774 )
    ( on b425 b254 )
    ( on b602 b425 )
    ( on b419 b602 )
    ( on b162 b419 )
    ( on b896 b162 )
    ( on b90 b896 )
    ( on b530 b90 )
    ( on b728 b530 )
    ( on b218 b728 )
    ( on b838 b218 )
    ( on b899 b838 )
    ( on b536 b899 )
    ( on b472 b536 )
    ( on b390 b472 )
    ( on b971 b390 )
    ( on b952 b971 )
    ( on b413 b952 )
    ( on b866 b413 )
    ( clear b866 )
  )
  ( :tasks
    ( Make-35Pile b853 b407 b421 b414 b574 b790 b858 b203 b937 b371 b113 b464 b486 b550 b287 b774 b254 b425 b602 b419 b162 b896 b90 b530 b728 b218 b838 b899 b536 b472 b390 b971 b952 b413 b866 )
  )
)
