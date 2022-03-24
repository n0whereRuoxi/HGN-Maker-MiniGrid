( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b320 - block
    b715 - block
    b526 - block
    b734 - block
    b818 - block
    b968 - block
    b481 - block
    b93 - block
    b807 - block
    b774 - block
    b738 - block
    b810 - block
    b720 - block
    b375 - block
    b470 - block
    b562 - block
    b276 - block
    b846 - block
    b742 - block
    b626 - block
    b527 - block
    b122 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b320 )
    ( on b715 b320 )
    ( on b526 b715 )
    ( on b734 b526 )
    ( on b818 b734 )
    ( on b968 b818 )
    ( on b481 b968 )
    ( on b93 b481 )
    ( on b807 b93 )
    ( on b774 b807 )
    ( on b738 b774 )
    ( on b810 b738 )
    ( on b720 b810 )
    ( on b375 b720 )
    ( on b470 b375 )
    ( on b562 b470 )
    ( on b276 b562 )
    ( on b846 b276 )
    ( on b742 b846 )
    ( on b626 b742 )
    ( on b527 b626 )
    ( on b122 b527 )
    ( clear b122 )
  )
  ( :goal
    ( and
      ( clear b320 )
    )
  )
)
