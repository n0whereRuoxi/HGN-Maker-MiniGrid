( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b857 - block
    b933 - block
    b88 - block
    b93 - block
    b254 - block
    b2 - block
    b804 - block
    b834 - block
    b191 - block
    b867 - block
    b780 - block
    b542 - block
    b911 - block
    b175 - block
    b887 - block
    b789 - block
    b164 - block
    b293 - block
    b800 - block
    b509 - block
    b239 - block
    b902 - block
    b309 - block
    b332 - block
    b655 - block
    b817 - block
    b394 - block
    b854 - block
    b450 - block
    b909 - block
    b590 - block
    b771 - block
    b853 - block
    b295 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b857 )
    ( on b933 b857 )
    ( on b88 b933 )
    ( on b93 b88 )
    ( on b254 b93 )
    ( on b2 b254 )
    ( on b804 b2 )
    ( on b834 b804 )
    ( on b191 b834 )
    ( on b867 b191 )
    ( on b780 b867 )
    ( on b542 b780 )
    ( on b911 b542 )
    ( on b175 b911 )
    ( on b887 b175 )
    ( on b789 b887 )
    ( on b164 b789 )
    ( on b293 b164 )
    ( on b800 b293 )
    ( on b509 b800 )
    ( on b239 b509 )
    ( on b902 b239 )
    ( on b309 b902 )
    ( on b332 b309 )
    ( on b655 b332 )
    ( on b817 b655 )
    ( on b394 b817 )
    ( on b854 b394 )
    ( on b450 b854 )
    ( on b909 b450 )
    ( on b590 b909 )
    ( on b771 b590 )
    ( on b853 b771 )
    ( on b295 b853 )
    ( clear b295 )
  )
  ( :tasks
    ( Make-33Pile b933 b88 b93 b254 b2 b804 b834 b191 b867 b780 b542 b911 b175 b887 b789 b164 b293 b800 b509 b239 b902 b309 b332 b655 b817 b394 b854 b450 b909 b590 b771 b853 b295 )
  )
)
