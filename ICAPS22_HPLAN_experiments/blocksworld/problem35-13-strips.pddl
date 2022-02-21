( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b875 - block
    b148 - block
    b704 - block
    b953 - block
    b595 - block
    b673 - block
    b239 - block
    b855 - block
    b752 - block
    b606 - block
    b421 - block
    b579 - block
    b253 - block
    b743 - block
    b320 - block
    b769 - block
    b158 - block
    b377 - block
    b785 - block
    b675 - block
    b883 - block
    b988 - block
    b215 - block
    b293 - block
    b498 - block
    b624 - block
    b927 - block
    b481 - block
    b317 - block
    b298 - block
    b784 - block
    b926 - block
    b842 - block
    b955 - block
    b817 - block
    b920 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b875 )
    ( on b148 b875 )
    ( on b704 b148 )
    ( on b953 b704 )
    ( on b595 b953 )
    ( on b673 b595 )
    ( on b239 b673 )
    ( on b855 b239 )
    ( on b752 b855 )
    ( on b606 b752 )
    ( on b421 b606 )
    ( on b579 b421 )
    ( on b253 b579 )
    ( on b743 b253 )
    ( on b320 b743 )
    ( on b769 b320 )
    ( on b158 b769 )
    ( on b377 b158 )
    ( on b785 b377 )
    ( on b675 b785 )
    ( on b883 b675 )
    ( on b988 b883 )
    ( on b215 b988 )
    ( on b293 b215 )
    ( on b498 b293 )
    ( on b624 b498 )
    ( on b927 b624 )
    ( on b481 b927 )
    ( on b317 b481 )
    ( on b298 b317 )
    ( on b784 b298 )
    ( on b926 b784 )
    ( on b842 b926 )
    ( on b955 b842 )
    ( on b817 b955 )
    ( on b920 b817 )
    ( clear b920 )
  )
  ( :goal
    ( and
      ( clear b875 )
    )
  )
)
