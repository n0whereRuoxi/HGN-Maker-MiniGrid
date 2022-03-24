( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b346 - block
    b776 - block
    b752 - block
    b551 - block
    b696 - block
    b931 - block
    b884 - block
    b714 - block
    b764 - block
    b271 - block
    b755 - block
    b945 - block
    b989 - block
    b701 - block
    b154 - block
    b340 - block
    b846 - block
    b508 - block
    b372 - block
    b952 - block
    b321 - block
    b688 - block
    b654 - block
    b678 - block
    b63 - block
    b179 - block
    b470 - block
    b749 - block
    b862 - block
    b53 - block
    b333 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b346 )
    ( on b776 b346 )
    ( on b752 b776 )
    ( on b551 b752 )
    ( on b696 b551 )
    ( on b931 b696 )
    ( on b884 b931 )
    ( on b714 b884 )
    ( on b764 b714 )
    ( on b271 b764 )
    ( on b755 b271 )
    ( on b945 b755 )
    ( on b989 b945 )
    ( on b701 b989 )
    ( on b154 b701 )
    ( on b340 b154 )
    ( on b846 b340 )
    ( on b508 b846 )
    ( on b372 b508 )
    ( on b952 b372 )
    ( on b321 b952 )
    ( on b688 b321 )
    ( on b654 b688 )
    ( on b678 b654 )
    ( on b63 b678 )
    ( on b179 b63 )
    ( on b470 b179 )
    ( on b749 b470 )
    ( on b862 b749 )
    ( on b53 b862 )
    ( on b333 b53 )
    ( clear b333 )
  )
  ( :goal
    ( and
      ( clear b346 )
    )
  )
)
