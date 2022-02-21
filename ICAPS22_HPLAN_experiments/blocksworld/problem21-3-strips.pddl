( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b127 - block
    b704 - block
    b674 - block
    b678 - block
    b992 - block
    b393 - block
    b546 - block
    b490 - block
    b234 - block
    b252 - block
    b686 - block
    b825 - block
    b789 - block
    b143 - block
    b246 - block
    b378 - block
    b536 - block
    b18 - block
    b58 - block
    b723 - block
    b847 - block
    b915 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b127 )
    ( on b704 b127 )
    ( on b674 b704 )
    ( on b678 b674 )
    ( on b992 b678 )
    ( on b393 b992 )
    ( on b546 b393 )
    ( on b490 b546 )
    ( on b234 b490 )
    ( on b252 b234 )
    ( on b686 b252 )
    ( on b825 b686 )
    ( on b789 b825 )
    ( on b143 b789 )
    ( on b246 b143 )
    ( on b378 b246 )
    ( on b536 b378 )
    ( on b18 b536 )
    ( on b58 b18 )
    ( on b723 b58 )
    ( on b847 b723 )
    ( on b915 b847 )
    ( clear b915 )
  )
  ( :goal
    ( and
      ( clear b127 )
    )
  )
)
