( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b740 - block
    b455 - block
    b847 - block
    b362 - block
    b204 - block
    b975 - block
    b181 - block
    b332 - block
    b481 - block
    b388 - block
    b530 - block
    b589 - block
    b476 - block
    b608 - block
    b310 - block
    b472 - block
    b28 - block
    b463 - block
    b986 - block
    b724 - block
    b959 - block
    b203 - block
    b547 - block
    b363 - block
    b20 - block
    b643 - block
    b483 - block
    b596 - block
    b412 - block
    b728 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b740 )
    ( on b455 b740 )
    ( on b847 b455 )
    ( on b362 b847 )
    ( on b204 b362 )
    ( on b975 b204 )
    ( on b181 b975 )
    ( on b332 b181 )
    ( on b481 b332 )
    ( on b388 b481 )
    ( on b530 b388 )
    ( on b589 b530 )
    ( on b476 b589 )
    ( on b608 b476 )
    ( on b310 b608 )
    ( on b472 b310 )
    ( on b28 b472 )
    ( on b463 b28 )
    ( on b986 b463 )
    ( on b724 b986 )
    ( on b959 b724 )
    ( on b203 b959 )
    ( on b547 b203 )
    ( on b363 b547 )
    ( on b20 b363 )
    ( on b643 b20 )
    ( on b483 b643 )
    ( on b596 b483 )
    ( on b412 b596 )
    ( on b728 b412 )
    ( clear b728 )
  )
  ( :goal
    ( and
      ( clear b740 )
    )
  )
)
