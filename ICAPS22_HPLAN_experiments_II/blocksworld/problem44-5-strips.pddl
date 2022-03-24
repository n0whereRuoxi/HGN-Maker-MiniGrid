( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b665 - block
    b723 - block
    b169 - block
    b478 - block
    b779 - block
    b206 - block
    b934 - block
    b715 - block
    b573 - block
    b563 - block
    b853 - block
    b826 - block
    b604 - block
    b891 - block
    b613 - block
    b987 - block
    b264 - block
    b62 - block
    b683 - block
    b346 - block
    b446 - block
    b418 - block
    b93 - block
    b933 - block
    b637 - block
    b732 - block
    b388 - block
    b649 - block
    b539 - block
    b714 - block
    b313 - block
    b745 - block
    b73 - block
    b220 - block
    b534 - block
    b706 - block
    b969 - block
    b877 - block
    b331 - block
    b870 - block
    b427 - block
    b237 - block
    b365 - block
    b184 - block
    b741 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b665 )
    ( on b723 b665 )
    ( on b169 b723 )
    ( on b478 b169 )
    ( on b779 b478 )
    ( on b206 b779 )
    ( on b934 b206 )
    ( on b715 b934 )
    ( on b573 b715 )
    ( on b563 b573 )
    ( on b853 b563 )
    ( on b826 b853 )
    ( on b604 b826 )
    ( on b891 b604 )
    ( on b613 b891 )
    ( on b987 b613 )
    ( on b264 b987 )
    ( on b62 b264 )
    ( on b683 b62 )
    ( on b346 b683 )
    ( on b446 b346 )
    ( on b418 b446 )
    ( on b93 b418 )
    ( on b933 b93 )
    ( on b637 b933 )
    ( on b732 b637 )
    ( on b388 b732 )
    ( on b649 b388 )
    ( on b539 b649 )
    ( on b714 b539 )
    ( on b313 b714 )
    ( on b745 b313 )
    ( on b73 b745 )
    ( on b220 b73 )
    ( on b534 b220 )
    ( on b706 b534 )
    ( on b969 b706 )
    ( on b877 b969 )
    ( on b331 b877 )
    ( on b870 b331 )
    ( on b427 b870 )
    ( on b237 b427 )
    ( on b365 b237 )
    ( on b184 b365 )
    ( on b741 b184 )
    ( clear b741 )
  )
  ( :goal
    ( and
      ( clear b665 )
    )
  )
)
