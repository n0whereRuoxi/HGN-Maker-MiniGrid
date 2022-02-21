( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b868 - block
    b95 - block
    b579 - block
    b247 - block
    b741 - block
    b107 - block
    b898 - block
    b216 - block
    b324 - block
    b534 - block
    b613 - block
    b453 - block
    b966 - block
    b546 - block
    b155 - block
    b129 - block
    b720 - block
    b76 - block
    b290 - block
    b117 - block
    b416 - block
    b634 - block
    b726 - block
    b816 - block
    b468 - block
    b922 - block
    b244 - block
    b785 - block
    b980 - block
    b50 - block
    b731 - block
    b847 - block
    b614 - block
    b87 - block
    b274 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b868 )
    ( on b95 b868 )
    ( on b579 b95 )
    ( on b247 b579 )
    ( on b741 b247 )
    ( on b107 b741 )
    ( on b898 b107 )
    ( on b216 b898 )
    ( on b324 b216 )
    ( on b534 b324 )
    ( on b613 b534 )
    ( on b453 b613 )
    ( on b966 b453 )
    ( on b546 b966 )
    ( on b155 b546 )
    ( on b129 b155 )
    ( on b720 b129 )
    ( on b76 b720 )
    ( on b290 b76 )
    ( on b117 b290 )
    ( on b416 b117 )
    ( on b634 b416 )
    ( on b726 b634 )
    ( on b816 b726 )
    ( on b468 b816 )
    ( on b922 b468 )
    ( on b244 b922 )
    ( on b785 b244 )
    ( on b980 b785 )
    ( on b50 b980 )
    ( on b731 b50 )
    ( on b847 b731 )
    ( on b614 b847 )
    ( on b87 b614 )
    ( on b274 b87 )
    ( clear b274 )
  )
  ( :goal
    ( and
      ( clear b868 )
    )
  )
)
