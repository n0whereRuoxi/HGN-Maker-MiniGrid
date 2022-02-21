( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b222 - block
    b98 - block
    b850 - block
    b650 - block
    b877 - block
    b297 - block
    b429 - block
    b281 - block
    b607 - block
    b388 - block
    b775 - block
    b880 - block
    b77 - block
    b899 - block
    b932 - block
    b350 - block
    b825 - block
    b824 - block
    b92 - block
    b79 - block
    b398 - block
    b493 - block
    b373 - block
    b530 - block
    b814 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b222 )
    ( on b98 b222 )
    ( on b850 b98 )
    ( on b650 b850 )
    ( on b877 b650 )
    ( on b297 b877 )
    ( on b429 b297 )
    ( on b281 b429 )
    ( on b607 b281 )
    ( on b388 b607 )
    ( on b775 b388 )
    ( on b880 b775 )
    ( on b77 b880 )
    ( on b899 b77 )
    ( on b932 b899 )
    ( on b350 b932 )
    ( on b825 b350 )
    ( on b824 b825 )
    ( on b92 b824 )
    ( on b79 b92 )
    ( on b398 b79 )
    ( on b493 b398 )
    ( on b373 b493 )
    ( on b530 b373 )
    ( on b814 b530 )
    ( clear b814 )
  )
  ( :goal
    ( and
      ( clear b222 )
    )
  )
)
