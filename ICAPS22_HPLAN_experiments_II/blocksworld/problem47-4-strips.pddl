( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b240 - block
    b491 - block
    b244 - block
    b404 - block
    b116 - block
    b699 - block
    b893 - block
    b639 - block
    b413 - block
    b933 - block
    b88 - block
    b172 - block
    b586 - block
    b796 - block
    b247 - block
    b957 - block
    b502 - block
    b773 - block
    b882 - block
    b267 - block
    b208 - block
    b587 - block
    b434 - block
    b684 - block
    b433 - block
    b605 - block
    b641 - block
    b891 - block
    b536 - block
    b2 - block
    b581 - block
    b80 - block
    b873 - block
    b575 - block
    b792 - block
    b584 - block
    b164 - block
    b713 - block
    b92 - block
    b778 - block
    b880 - block
    b768 - block
    b188 - block
    b431 - block
    b724 - block
    b756 - block
    b745 - block
    b825 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b240 )
    ( on b491 b240 )
    ( on b244 b491 )
    ( on b404 b244 )
    ( on b116 b404 )
    ( on b699 b116 )
    ( on b893 b699 )
    ( on b639 b893 )
    ( on b413 b639 )
    ( on b933 b413 )
    ( on b88 b933 )
    ( on b172 b88 )
    ( on b586 b172 )
    ( on b796 b586 )
    ( on b247 b796 )
    ( on b957 b247 )
    ( on b502 b957 )
    ( on b773 b502 )
    ( on b882 b773 )
    ( on b267 b882 )
    ( on b208 b267 )
    ( on b587 b208 )
    ( on b434 b587 )
    ( on b684 b434 )
    ( on b433 b684 )
    ( on b605 b433 )
    ( on b641 b605 )
    ( on b891 b641 )
    ( on b536 b891 )
    ( on b2 b536 )
    ( on b581 b2 )
    ( on b80 b581 )
    ( on b873 b80 )
    ( on b575 b873 )
    ( on b792 b575 )
    ( on b584 b792 )
    ( on b164 b584 )
    ( on b713 b164 )
    ( on b92 b713 )
    ( on b778 b92 )
    ( on b880 b778 )
    ( on b768 b880 )
    ( on b188 b768 )
    ( on b431 b188 )
    ( on b724 b431 )
    ( on b756 b724 )
    ( on b745 b756 )
    ( on b825 b745 )
    ( clear b825 )
  )
  ( :goal
    ( and
      ( clear b240 )
    )
  )
)
