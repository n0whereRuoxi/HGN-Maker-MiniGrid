( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b106 - block
    b707 - block
    b797 - block
    b565 - block
    b845 - block
    b726 - block
    b300 - block
    b717 - block
    b712 - block
    b782 - block
    b162 - block
    b394 - block
    b660 - block
    b826 - block
    b890 - block
    b392 - block
    b869 - block
    b401 - block
    b965 - block
    b996 - block
    b747 - block
    b709 - block
    b399 - block
    b344 - block
    b138 - block
    b534 - block
    b793 - block
    b986 - block
    b533 - block
    b428 - block
    b158 - block
    b744 - block
    b951 - block
    b330 - block
    b427 - block
    b876 - block
    b143 - block
    b451 - block
    b140 - block
    b263 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b106 )
    ( on b707 b106 )
    ( on b797 b707 )
    ( on b565 b797 )
    ( on b845 b565 )
    ( on b726 b845 )
    ( on b300 b726 )
    ( on b717 b300 )
    ( on b712 b717 )
    ( on b782 b712 )
    ( on b162 b782 )
    ( on b394 b162 )
    ( on b660 b394 )
    ( on b826 b660 )
    ( on b890 b826 )
    ( on b392 b890 )
    ( on b869 b392 )
    ( on b401 b869 )
    ( on b965 b401 )
    ( on b996 b965 )
    ( on b747 b996 )
    ( on b709 b747 )
    ( on b399 b709 )
    ( on b344 b399 )
    ( on b138 b344 )
    ( on b534 b138 )
    ( on b793 b534 )
    ( on b986 b793 )
    ( on b533 b986 )
    ( on b428 b533 )
    ( on b158 b428 )
    ( on b744 b158 )
    ( on b951 b744 )
    ( on b330 b951 )
    ( on b427 b330 )
    ( on b876 b427 )
    ( on b143 b876 )
    ( on b451 b143 )
    ( on b140 b451 )
    ( on b263 b140 )
    ( clear b263 )
  )
  ( :goal
    ( and
      ( clear b106 )
    )
  )
)
