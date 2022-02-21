( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b258 - block
    b496 - block
    b665 - block
    b570 - block
    b16 - block
    b940 - block
    b934 - block
    b726 - block
    b32 - block
    b182 - block
    b428 - block
    b469 - block
    b613 - block
    b847 - block
    b728 - block
    b373 - block
    b562 - block
    b165 - block
    b866 - block
    b439 - block
    b711 - block
    b346 - block
    b283 - block
    b239 - block
    b101 - block
    b638 - block
    b843 - block
    b839 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b258 )
    ( on b496 b258 )
    ( on b665 b496 )
    ( on b570 b665 )
    ( on b16 b570 )
    ( on b940 b16 )
    ( on b934 b940 )
    ( on b726 b934 )
    ( on b32 b726 )
    ( on b182 b32 )
    ( on b428 b182 )
    ( on b469 b428 )
    ( on b613 b469 )
    ( on b847 b613 )
    ( on b728 b847 )
    ( on b373 b728 )
    ( on b562 b373 )
    ( on b165 b562 )
    ( on b866 b165 )
    ( on b439 b866 )
    ( on b711 b439 )
    ( on b346 b711 )
    ( on b283 b346 )
    ( on b239 b283 )
    ( on b101 b239 )
    ( on b638 b101 )
    ( on b843 b638 )
    ( on b839 b843 )
    ( clear b839 )
  )
  ( :goal
    ( and
      ( clear b258 )
    )
  )
)
