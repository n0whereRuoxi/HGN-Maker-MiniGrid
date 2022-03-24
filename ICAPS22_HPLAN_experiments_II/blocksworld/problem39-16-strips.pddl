( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b866 - block
    b951 - block
    b841 - block
    b530 - block
    b471 - block
    b540 - block
    b89 - block
    b546 - block
    b536 - block
    b149 - block
    b955 - block
    b539 - block
    b862 - block
    b561 - block
    b701 - block
    b305 - block
    b172 - block
    b905 - block
    b222 - block
    b919 - block
    b681 - block
    b76 - block
    b923 - block
    b518 - block
    b194 - block
    b420 - block
    b227 - block
    b630 - block
    b207 - block
    b250 - block
    b42 - block
    b238 - block
    b825 - block
    b404 - block
    b98 - block
    b189 - block
    b760 - block
    b895 - block
    b418 - block
    b28 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b866 )
    ( on b951 b866 )
    ( on b841 b951 )
    ( on b530 b841 )
    ( on b471 b530 )
    ( on b540 b471 )
    ( on b89 b540 )
    ( on b546 b89 )
    ( on b536 b546 )
    ( on b149 b536 )
    ( on b955 b149 )
    ( on b539 b955 )
    ( on b862 b539 )
    ( on b561 b862 )
    ( on b701 b561 )
    ( on b305 b701 )
    ( on b172 b305 )
    ( on b905 b172 )
    ( on b222 b905 )
    ( on b919 b222 )
    ( on b681 b919 )
    ( on b76 b681 )
    ( on b923 b76 )
    ( on b518 b923 )
    ( on b194 b518 )
    ( on b420 b194 )
    ( on b227 b420 )
    ( on b630 b227 )
    ( on b207 b630 )
    ( on b250 b207 )
    ( on b42 b250 )
    ( on b238 b42 )
    ( on b825 b238 )
    ( on b404 b825 )
    ( on b98 b404 )
    ( on b189 b98 )
    ( on b760 b189 )
    ( on b895 b760 )
    ( on b418 b895 )
    ( on b28 b418 )
    ( clear b28 )
  )
  ( :goal
    ( and
      ( clear b866 )
    )
  )
)
