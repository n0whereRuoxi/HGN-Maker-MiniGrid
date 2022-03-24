( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b337 - block
    b835 - block
    b9 - block
    b661 - block
    b292 - block
    b556 - block
    b29 - block
    b732 - block
    b748 - block
    b833 - block
    b557 - block
    b697 - block
    b678 - block
    b763 - block
    b646 - block
    b400 - block
    b860 - block
    b211 - block
    b467 - block
    b992 - block
    b405 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b337 )
    ( on b835 b337 )
    ( on b9 b835 )
    ( on b661 b9 )
    ( on b292 b661 )
    ( on b556 b292 )
    ( on b29 b556 )
    ( on b732 b29 )
    ( on b748 b732 )
    ( on b833 b748 )
    ( on b557 b833 )
    ( on b697 b557 )
    ( on b678 b697 )
    ( on b763 b678 )
    ( on b646 b763 )
    ( on b400 b646 )
    ( on b860 b400 )
    ( on b211 b860 )
    ( on b467 b211 )
    ( on b992 b467 )
    ( on b405 b992 )
    ( clear b405 )
  )
  ( :tasks
    ( Make-20Pile b835 b9 b661 b292 b556 b29 b732 b748 b833 b557 b697 b678 b763 b646 b400 b860 b211 b467 b992 b405 )
  )
)
