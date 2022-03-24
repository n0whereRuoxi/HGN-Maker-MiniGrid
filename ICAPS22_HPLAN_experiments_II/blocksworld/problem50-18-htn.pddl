( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b957 - block
    b511 - block
    b616 - block
    b450 - block
    b497 - block
    b478 - block
    b924 - block
    b462 - block
    b654 - block
    b883 - block
    b235 - block
    b537 - block
    b76 - block
    b981 - block
    b706 - block
    b18 - block
    b367 - block
    b165 - block
    b672 - block
    b243 - block
    b832 - block
    b644 - block
    b465 - block
    b355 - block
    b245 - block
    b261 - block
    b674 - block
    b290 - block
    b842 - block
    b149 - block
    b325 - block
    b391 - block
    b51 - block
    b636 - block
    b361 - block
    b683 - block
    b908 - block
    b58 - block
    b811 - block
    b517 - block
    b568 - block
    b374 - block
    b528 - block
    b555 - block
    b394 - block
    b884 - block
    b764 - block
    b599 - block
    b438 - block
    b974 - block
    b605 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b957 )
    ( on b511 b957 )
    ( on b616 b511 )
    ( on b450 b616 )
    ( on b497 b450 )
    ( on b478 b497 )
    ( on b924 b478 )
    ( on b462 b924 )
    ( on b654 b462 )
    ( on b883 b654 )
    ( on b235 b883 )
    ( on b537 b235 )
    ( on b76 b537 )
    ( on b981 b76 )
    ( on b706 b981 )
    ( on b18 b706 )
    ( on b367 b18 )
    ( on b165 b367 )
    ( on b672 b165 )
    ( on b243 b672 )
    ( on b832 b243 )
    ( on b644 b832 )
    ( on b465 b644 )
    ( on b355 b465 )
    ( on b245 b355 )
    ( on b261 b245 )
    ( on b674 b261 )
    ( on b290 b674 )
    ( on b842 b290 )
    ( on b149 b842 )
    ( on b325 b149 )
    ( on b391 b325 )
    ( on b51 b391 )
    ( on b636 b51 )
    ( on b361 b636 )
    ( on b683 b361 )
    ( on b908 b683 )
    ( on b58 b908 )
    ( on b811 b58 )
    ( on b517 b811 )
    ( on b568 b517 )
    ( on b374 b568 )
    ( on b528 b374 )
    ( on b555 b528 )
    ( on b394 b555 )
    ( on b884 b394 )
    ( on b764 b884 )
    ( on b599 b764 )
    ( on b438 b599 )
    ( on b974 b438 )
    ( on b605 b974 )
    ( clear b605 )
  )
  ( :tasks
    ( Make-50Pile b511 b616 b450 b497 b478 b924 b462 b654 b883 b235 b537 b76 b981 b706 b18 b367 b165 b672 b243 b832 b644 b465 b355 b245 b261 b674 b290 b842 b149 b325 b391 b51 b636 b361 b683 b908 b58 b811 b517 b568 b374 b528 b555 b394 b884 b764 b599 b438 b974 b605 )
  )
)
