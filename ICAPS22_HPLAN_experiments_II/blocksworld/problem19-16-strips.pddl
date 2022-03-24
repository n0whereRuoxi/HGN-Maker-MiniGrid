( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b417 - block
    b206 - block
    b570 - block
    b355 - block
    b421 - block
    b703 - block
    b197 - block
    b879 - block
    b740 - block
    b391 - block
    b805 - block
    b873 - block
    b272 - block
    b48 - block
    b117 - block
    b68 - block
    b344 - block
    b856 - block
    b558 - block
    b612 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b417 )
    ( on b206 b417 )
    ( on b570 b206 )
    ( on b355 b570 )
    ( on b421 b355 )
    ( on b703 b421 )
    ( on b197 b703 )
    ( on b879 b197 )
    ( on b740 b879 )
    ( on b391 b740 )
    ( on b805 b391 )
    ( on b873 b805 )
    ( on b272 b873 )
    ( on b48 b272 )
    ( on b117 b48 )
    ( on b68 b117 )
    ( on b344 b68 )
    ( on b856 b344 )
    ( on b558 b856 )
    ( on b612 b558 )
    ( clear b612 )
  )
  ( :goal
    ( and
      ( clear b417 )
    )
  )
)
