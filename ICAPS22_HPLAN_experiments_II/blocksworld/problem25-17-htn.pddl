( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b968 - block
    b973 - block
    b44 - block
    b12 - block
    b262 - block
    b220 - block
    b390 - block
    b643 - block
    b74 - block
    b845 - block
    b288 - block
    b490 - block
    b130 - block
    b283 - block
    b454 - block
    b149 - block
    b113 - block
    b921 - block
    b374 - block
    b135 - block
    b993 - block
    b125 - block
    b106 - block
    b103 - block
    b234 - block
    b516 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b968 )
    ( on b973 b968 )
    ( on b44 b973 )
    ( on b12 b44 )
    ( on b262 b12 )
    ( on b220 b262 )
    ( on b390 b220 )
    ( on b643 b390 )
    ( on b74 b643 )
    ( on b845 b74 )
    ( on b288 b845 )
    ( on b490 b288 )
    ( on b130 b490 )
    ( on b283 b130 )
    ( on b454 b283 )
    ( on b149 b454 )
    ( on b113 b149 )
    ( on b921 b113 )
    ( on b374 b921 )
    ( on b135 b374 )
    ( on b993 b135 )
    ( on b125 b993 )
    ( on b106 b125 )
    ( on b103 b106 )
    ( on b234 b103 )
    ( on b516 b234 )
    ( clear b516 )
  )
  ( :tasks
    ( Make-25Pile b973 b44 b12 b262 b220 b390 b643 b74 b845 b288 b490 b130 b283 b454 b149 b113 b921 b374 b135 b993 b125 b106 b103 b234 b516 )
  )
)
