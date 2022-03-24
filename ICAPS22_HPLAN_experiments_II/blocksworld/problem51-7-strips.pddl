( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b477 - block
    b826 - block
    b706 - block
    b165 - block
    b260 - block
    b157 - block
    b65 - block
    b116 - block
    b738 - block
    b654 - block
    b267 - block
    b386 - block
    b15 - block
    b268 - block
    b932 - block
    b322 - block
    b35 - block
    b695 - block
    b968 - block
    b862 - block
    b845 - block
    b189 - block
    b264 - block
    b417 - block
    b216 - block
    b7 - block
    b103 - block
    b937 - block
    b718 - block
    b44 - block
    b588 - block
    b797 - block
    b704 - block
    b397 - block
    b201 - block
    b807 - block
    b282 - block
    b78 - block
    b599 - block
    b794 - block
    b860 - block
    b50 - block
    b613 - block
    b897 - block
    b956 - block
    b135 - block
    b166 - block
    b873 - block
    b384 - block
    b472 - block
    b56 - block
    b681 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b477 )
    ( on b826 b477 )
    ( on b706 b826 )
    ( on b165 b706 )
    ( on b260 b165 )
    ( on b157 b260 )
    ( on b65 b157 )
    ( on b116 b65 )
    ( on b738 b116 )
    ( on b654 b738 )
    ( on b267 b654 )
    ( on b386 b267 )
    ( on b15 b386 )
    ( on b268 b15 )
    ( on b932 b268 )
    ( on b322 b932 )
    ( on b35 b322 )
    ( on b695 b35 )
    ( on b968 b695 )
    ( on b862 b968 )
    ( on b845 b862 )
    ( on b189 b845 )
    ( on b264 b189 )
    ( on b417 b264 )
    ( on b216 b417 )
    ( on b7 b216 )
    ( on b103 b7 )
    ( on b937 b103 )
    ( on b718 b937 )
    ( on b44 b718 )
    ( on b588 b44 )
    ( on b797 b588 )
    ( on b704 b797 )
    ( on b397 b704 )
    ( on b201 b397 )
    ( on b807 b201 )
    ( on b282 b807 )
    ( on b78 b282 )
    ( on b599 b78 )
    ( on b794 b599 )
    ( on b860 b794 )
    ( on b50 b860 )
    ( on b613 b50 )
    ( on b897 b613 )
    ( on b956 b897 )
    ( on b135 b956 )
    ( on b166 b135 )
    ( on b873 b166 )
    ( on b384 b873 )
    ( on b472 b384 )
    ( on b56 b472 )
    ( on b681 b56 )
    ( clear b681 )
  )
  ( :goal
    ( and
      ( clear b477 )
    )
  )
)
