( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b571 - block
    b712 - block
    b624 - block
    b946 - block
    b883 - block
    b118 - block
    b718 - block
    b862 - block
    b640 - block
    b61 - block
    b789 - block
    b200 - block
    b185 - block
    b332 - block
    b608 - block
    b70 - block
    b487 - block
    b362 - block
    b750 - block
    b960 - block
    b903 - block
    b880 - block
    b708 - block
    b602 - block
    b46 - block
    b160 - block
    b223 - block
    b146 - block
    b697 - block
    b258 - block
    b988 - block
    b353 - block
    b507 - block
    b292 - block
    b659 - block
    b522 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b571 )
    ( on b712 b571 )
    ( on b624 b712 )
    ( on b946 b624 )
    ( on b883 b946 )
    ( on b118 b883 )
    ( on b718 b118 )
    ( on b862 b718 )
    ( on b640 b862 )
    ( on b61 b640 )
    ( on b789 b61 )
    ( on b200 b789 )
    ( on b185 b200 )
    ( on b332 b185 )
    ( on b608 b332 )
    ( on b70 b608 )
    ( on b487 b70 )
    ( on b362 b487 )
    ( on b750 b362 )
    ( on b960 b750 )
    ( on b903 b960 )
    ( on b880 b903 )
    ( on b708 b880 )
    ( on b602 b708 )
    ( on b46 b602 )
    ( on b160 b46 )
    ( on b223 b160 )
    ( on b146 b223 )
    ( on b697 b146 )
    ( on b258 b697 )
    ( on b988 b258 )
    ( on b353 b988 )
    ( on b507 b353 )
    ( on b292 b507 )
    ( on b659 b292 )
    ( on b522 b659 )
    ( clear b522 )
  )
  ( :goal
    ( and
      ( clear b571 )
    )
  )
)
