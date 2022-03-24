( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b764 - block
    b140 - block
    b229 - block
    b78 - block
    b314 - block
    b910 - block
    b848 - block
    b974 - block
    b897 - block
    b899 - block
    b415 - block
    b916 - block
    b771 - block
    b763 - block
    b377 - block
    b700 - block
    b473 - block
    b898 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b764 )
    ( on b140 b764 )
    ( on b229 b140 )
    ( on b78 b229 )
    ( on b314 b78 )
    ( on b910 b314 )
    ( on b848 b910 )
    ( on b974 b848 )
    ( on b897 b974 )
    ( on b899 b897 )
    ( on b415 b899 )
    ( on b916 b415 )
    ( on b771 b916 )
    ( on b763 b771 )
    ( on b377 b763 )
    ( on b700 b377 )
    ( on b473 b700 )
    ( on b898 b473 )
    ( clear b898 )
  )
  ( :tasks
    ( Make-17Pile b140 b229 b78 b314 b910 b848 b974 b897 b899 b415 b916 b771 b763 b377 b700 b473 b898 )
  )
)
