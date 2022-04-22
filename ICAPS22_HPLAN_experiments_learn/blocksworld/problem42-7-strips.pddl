( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b780 - block
    b493 - block
    b605 - block
    b719 - block
    b548 - block
    b855 - block
    b294 - block
    b246 - block
    b613 - block
    b301 - block
    b641 - block
    b795 - block
    b419 - block
    b847 - block
    b793 - block
    b300 - block
    b110 - block
    b746 - block
    b880 - block
    b844 - block
    b372 - block
    b644 - block
    b640 - block
    b445 - block
    b256 - block
    b937 - block
    b151 - block
    b786 - block
    b665 - block
    b955 - block
    b59 - block
    b48 - block
    b696 - block
    b114 - block
    b390 - block
    b113 - block
    b299 - block
    b158 - block
    b130 - block
    b883 - block
    b903 - block
    b22 - block
    b494 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b780 )
    ( on b493 b780 )
    ( on b605 b493 )
    ( on b719 b605 )
    ( on b548 b719 )
    ( on b855 b548 )
    ( on b294 b855 )
    ( on b246 b294 )
    ( on b613 b246 )
    ( on b301 b613 )
    ( on b641 b301 )
    ( on b795 b641 )
    ( on b419 b795 )
    ( on b847 b419 )
    ( on b793 b847 )
    ( on b300 b793 )
    ( on b110 b300 )
    ( on b746 b110 )
    ( on b880 b746 )
    ( on b844 b880 )
    ( on b372 b844 )
    ( on b644 b372 )
    ( on b640 b644 )
    ( on b445 b640 )
    ( on b256 b445 )
    ( on b937 b256 )
    ( on b151 b937 )
    ( on b786 b151 )
    ( on b665 b786 )
    ( on b955 b665 )
    ( on b59 b955 )
    ( on b48 b59 )
    ( on b696 b48 )
    ( on b114 b696 )
    ( on b390 b114 )
    ( on b113 b390 )
    ( on b299 b113 )
    ( on b158 b299 )
    ( on b130 b158 )
    ( on b883 b130 )
    ( on b903 b883 )
    ( on b22 b903 )
    ( on b494 b22 )
    ( clear b494 )
  )
  ( :goal
    ( and
      ( clear b780 )
    )
  )
)
