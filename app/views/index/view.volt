<div class="container" style="margin-top: 130px;">
    <div class="col-lg-10 col-lg-offset-1">
        <div class="row">
            <div class="col-lg-12">
                <ul class="col-lg-12 text-left list-inline" style="padding-left: 0">
                    {# https://buttons.github.io #}
                    <li><a class="github-button" href="https://github.com/{{ project['owner']['login'] }}" data-count-href="/{{ project['owner']['login'] }}/followers" data-count-api="/users/{{ project['owner']['login'] }}#followers">Follow @{{ project['owner']['login'] }}</a></li>
                    <li><a class="github-button" href="https://github.com/{{ project['full_name'] }}" data-icon="octicon-eye" data-count-href="/{{ project['full_name'] }}/watchers" data-count-api="/repos/{{ project['full_name'] }}#subscribers_count">Watch</a></li>
                    <li><a class="github-button" href="https://github.com/{{ project['full_name'] }}" data-icon="octicon-star" data-count-href="/{{ project['full_name'] }}/stargazers" data-count-api="/repos/{{ project['full_name'] }}#stargazers_count">Star</a></li>
                    <li><a class="github-button" href="https://github.com/{{ project['full_name'] }}" data-icon="octicon-git-branch" {#data-style="mega" #}data-count-href="/{{ project['full_name'] }}/network" data-count-api="/repos/{{ project['full_name'] }}#forks_count">Fork</a></li>
                    <li><a class="github-button" href="https://github.com/{{ project['full_name'] }}/archive/master.zip" data-icon="octicon-cloud-download">Download</a>
                </ul>
                <h3>
                    <small><a href="https://github.com/{{ project['owner']['login'] }}">{{ project['owner']['login'] }}</small>
                    <a href="{{ project['urls']['html'] }}">{{ project['repo'] }}</a>
                </h3>

                <p>{{ project['description'] }}</p>
            </div>
        </div>

        <div class="row">
            <hr/>
            <div class="col-lg-6">
                Created: <span class="label label-default"><?= \Models\Project::utcTime($project['created'])->format('M d, Y') ?></span><br>
                Updated: <span class="label label-default"><?= \Models\Project::utcTime($project['updated'])->format('M d, Y') ?></span><br>
                Composer:
                <span class="label label-default">
                    <i class="glyphicon glyphicon-music"></i>
                    {% if project['is_composer'] %}
                        &nbsp;&nbsp;<i class="glyphicon glyphicon-check"></i>
                    {% else %}
                        &nbsp;&nbsp;<i class="glyphicon glyphicon-unchecked"></i>
                    {% endif %}
                </span><br>

                {% if project['composer']['license'] is defined AND project['composer']['license'] %}
                    License:
                    <span class="label label-default">{{ project['composer']['license'] }}</span><br>
                {% endif %}
                {% if project['composer']['version'] is defined AND project['composer']['version'] %}
                    Version:
                    <span class="label label-default">{{ project['composer']['version'] }}</span><br/>
                {% endif %}

                {% if project['composer']['authors'] is defined AND project['composer']['authors'] %}
                    Authors:
                    {% for author in project['composer']['authors'] %}
                        <span class="label label-default">{{ author['name'] }}</span>
                    {% endfor %}
                    <br/>
                {% endif %}

                {% if project['composer']['require'] is defined AND project['composer']['require'] %}
                    <ul class="list-inline">
                        <li>Requires:</li>
                        {% for key, ver in project['composer']['require'] %}
                            <li class="label label-warning">{{ key ~ ' ' ~ ver }}</li>
                        {% endfor %}
                    </ul>
                {% endif %}
            </div>

            <div class="col-lg-6">
                {% if project['downloads']['total'] is defined AND project['downloads']['total'] > 0%}
                <h5>Downloads</h5>
                Total: <span class="label label-default">{{ project['downloads']['total'] }}</span><br>
                Monthly: <span class="label label-default">{{ project['downloads']['monthly'] }}</span><br>
                Daily: <span class="label label-default">{{ project['downloads']['daily'] }}</span><br>
                {% endif %}
            </div>
        </div>


        <div class="row col-lg-12">
            <hr/>
            <article>
                {{ project['readme'] }}
            </article>
            <hr/>
        </div>
    </div>
</div>
