( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b83 - block
    b429 - block
    b605 - block
    b609 - block
    b736 - block
    b317 - block
    b205 - block
    b253 - block
    b330 - block
    b932 - block
    b180 - block
    b378 - block
    b934 - block
    b977 - block
    b30 - block
    b164 - block
    b821 - block
    b951 - block
    b493 - block
    b529 - block
    b946 - block
    b495 - block
    b780 - block
    b509 - block
    b881 - block
    b990 - block
    b465 - block
    b135 - block
    b569 - block
    b515 - block
    b294 - block
    b335 - block
    b289 - block
    b463 - block
    b273 - block
    b382 - block
    b297 - block
    b713 - block
    b585 - block
    b537 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b83 )
    ( on b429 b83 )
    ( on b605 b429 )
    ( on b609 b605 )
    ( on b736 b609 )
    ( on b317 b736 )
    ( on b205 b317 )
    ( on b253 b205 )
    ( on b330 b253 )
    ( on b932 b330 )
    ( on b180 b932 )
    ( on b378 b180 )
    ( on b934 b378 )
    ( on b977 b934 )
    ( on b30 b977 )
    ( on b164 b30 )
    ( on b821 b164 )
    ( on b951 b821 )
    ( on b493 b951 )
    ( on b529 b493 )
    ( on b946 b529 )
    ( on b495 b946 )
    ( on b780 b495 )
    ( on b509 b780 )
    ( on b881 b509 )
    ( on b990 b881 )
    ( on b465 b990 )
    ( on b135 b465 )
    ( on b569 b135 )
    ( on b515 b569 )
    ( on b294 b515 )
    ( on b335 b294 )
    ( on b289 b335 )
    ( on b463 b289 )
    ( on b273 b463 )
    ( on b382 b273 )
    ( on b297 b382 )
    ( on b713 b297 )
    ( on b585 b713 )
    ( on b537 b585 )
    ( clear b537 )
  )
  ( :goal
    ( and
      ( clear b83 )
    )
  )
)
