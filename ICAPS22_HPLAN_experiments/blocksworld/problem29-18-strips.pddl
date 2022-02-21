( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b912 - block
    b682 - block
    b893 - block
    b33 - block
    b613 - block
    b153 - block
    b126 - block
    b647 - block
    b327 - block
    b128 - block
    b120 - block
    b201 - block
    b832 - block
    b986 - block
    b997 - block
    b761 - block
    b818 - block
    b462 - block
    b603 - block
    b706 - block
    b552 - block
    b253 - block
    b741 - block
    b167 - block
    b537 - block
    b465 - block
    b144 - block
    b992 - block
    b532 - block
    b715 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b912 )
    ( on b682 b912 )
    ( on b893 b682 )
    ( on b33 b893 )
    ( on b613 b33 )
    ( on b153 b613 )
    ( on b126 b153 )
    ( on b647 b126 )
    ( on b327 b647 )
    ( on b128 b327 )
    ( on b120 b128 )
    ( on b201 b120 )
    ( on b832 b201 )
    ( on b986 b832 )
    ( on b997 b986 )
    ( on b761 b997 )
    ( on b818 b761 )
    ( on b462 b818 )
    ( on b603 b462 )
    ( on b706 b603 )
    ( on b552 b706 )
    ( on b253 b552 )
    ( on b741 b253 )
    ( on b167 b741 )
    ( on b537 b167 )
    ( on b465 b537 )
    ( on b144 b465 )
    ( on b992 b144 )
    ( on b532 b992 )
    ( on b715 b532 )
    ( clear b715 )
  )
  ( :goal
    ( and
      ( clear b912 )
    )
  )
)
